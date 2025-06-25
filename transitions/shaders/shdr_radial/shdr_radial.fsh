uniform sampler2D from_tex;
uniform sampler2D to_tex;
uniform float progress;

varying vec2 v_vTexcoord;

vec4 getToColor(vec2 uv) {
    return texture2D(to_tex, uv);
}

vec4 getFromColor(vec2 uv) {
    return texture2D(from_tex, uv);
}

// ---- transition -----

uniform float smoothness;

const float PI = 3.141592653589;

vec4 transition(vec2 p) {
  vec2 rp = p*2.-1.;
  return mix(
    getToColor(p),
    getFromColor(p),
    smoothstep(0., smoothness, atan(rp.y,rp.x) - (progress-.5) * PI * 2.5)
  );
}


// ---- transition ----

void main() {
    gl_FragColor = transition(v_vTexcoord);
}
