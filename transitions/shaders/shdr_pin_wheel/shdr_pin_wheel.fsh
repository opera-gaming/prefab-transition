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


uniform float speed;

vec4 transition(vec2 uv) {
  
  vec2 p = uv.xy / vec2(1.0).xy;
  
  float circPos = atan(p.y - 0.5, p.x - 0.5) + progress * speed;
  float modPos = mod(circPos, 3.1415 / 4.);
  float signed = sign(progress - modPos);
  
  return mix(getToColor(p), getFromColor(p), step(signed, 0.5));
  
}

// ---- transition ----

void main() {
    gl_FragColor = transition(v_vTexcoord);
}
