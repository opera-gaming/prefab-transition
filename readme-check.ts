
// Usage: deno run --allow-read --allow-net readme-check.ts

const README_PATH = "./README.md";

// Match list items that start with - `shdr_...`
const SHDR_LINE = /^\s*-\s*`shdr_[^`]+`\s*—\s*(.+)$/i;
// Match all markdown links on a line: [Label](URL)
const MD_LINK = /\[([^\]]+)\]\((https?:\/\/[^\s)]+)\)/g;

// Convert a GitHub "blob" URL to the raw content URL
function toRaw(url: string): string {
  try {
    const u = new URL(url);
    if (u.hostname === "github.com" && u.pathname.includes("/blob/")) {
      u.hostname = "raw.githubusercontent.com";
      u.pathname = u.pathname.replace("/blob/", "/");
      return u.toString();
    }
    return url; // already raw or something else
  } catch {
    return url;
  }
}

// Extract filename from URL path (case sensitive)
function basenameFromUrl(url: string): string {
  try {
    const u = new URL(url);
    const parts = u.pathname.split("/");
    return parts[parts.length - 1];
  } catch {
    return "";
  }
}

type Row = {
  shaderVar: string;
  label: string;
  url: string;
  http: number | "ERR";
  mit: boolean | "SKIPPED";
  labelMatchesFilename: boolean;
};

async function main() {
  const readme = await Deno.readTextFile(README_PATH);

  // Find the "Third-Party Shader Notices" section lines (or just scan all lines)
  const lines = readme.split(/\r?\n/);

  const rows: Row[] = [];

  for (const line of lines) {
    if (!line.trim().startsWith("-")) continue;

    // Grab the shader var from the start if present (e.g., - `shdr_angular` — ...)
    const shaderVarMatch = line.match(/^-\s*`([^`]+)`/);
    const shaderVar = shaderVarMatch ? shaderVarMatch[1] : "(unknown)";

    // Only consider lines that look like the shader mapping lines
    if (!SHDR_LINE.test(line)) continue;

    // Collect every [label](url) on the line
    let m: RegExpExecArray | null;
    while ((m = MD_LINK.exec(line)) !== null) {
      const label = m[1].trim();
      const url = m[2].trim();

      // Compare label vs filename in the URL
      const fileName = basenameFromUrl(url);
      const labelMatchesFilename = label === fileName;

      // Build raw URL and fetch
      const raw = toRaw(url);

      let http: number | "ERR" = "ERR";
      let mit: boolean | "SKIPPED" = "SKIPPED";
      try {
        const res = await fetch(raw, { headers: { Accept: "text/plain" } });
        http = res.status;
        if (res.ok) {
          const text = await res.text();
          mit = /(^|\n)\s*\/\*\s*.*mit|MIT\s+License/i.test(text) || /license\s*:\s*MIT/i.test(text);
        }
      } catch (_) {
        http = "ERR";
        mit = "SKIPPED";
      }

      rows.push({ shaderVar, label, url, http, mit, labelMatchesFilename });
    }
  }

  // Pretty print
  const pad = (s: string, n: number) => (s.length >= n ? s : s + " ".repeat(n - s.length));
  console.log("\nShader link audit (from README.md):\n");
  console.log(
    [
      pad("shaderVar", 24),
      pad("label==filename", 16),
      pad("HTTP", 6),
      pad("MIT", 4),
      "url",
    ].join("  ")
  );
  console.log("-".repeat(90));

  let bad = 0;
  for (const r of rows) {
    const httpStr = typeof r.http === "number" ? String(r.http) : r.http;
    const mitStr = r.mit === true ? "yes" : r.mit === false ? "no" : "—";
    const matchStr = r.labelMatchesFilename ? "yes" : "no";
    const line = [
      pad(r.shaderVar, 24),
      pad(matchStr, 16),
      pad(httpStr, 6),
      pad(mitStr, 4),
      r.url,
    ].join("  ");
    console.log(line);

    if (r.http !== 200 || r.mit === false || !r.labelMatchesFilename) {
      bad++;
    }
  }

  console.log("\nSummary:");
  console.log(`  Checked links: ${rows.length}`);
  console.log(`  Issues found : ${bad}`);

  // CI-friendly: non-zero exit on any problem
  if (bad > 0) Deno.exit(1);
}

await main();
