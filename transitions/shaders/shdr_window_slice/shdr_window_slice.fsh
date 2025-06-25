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


uniform float count;
uniform float smoothness;

vec4 transition (vec2 p) {
  float pr = smoothstep(-smoothness, 0.0, p.x - progress * (1.0 + smoothness));
  float s = step(pr, fract(count * p.x));
  return mix(getFromColor(p), getToColor(p), s);
}


// ---- transition ----

void main() {
    gl_FragColor = transition(v_vTexcoord);
}
