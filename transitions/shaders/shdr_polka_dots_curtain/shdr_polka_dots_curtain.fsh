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

const float SQRT_2 = 1.414213562373;
uniform float dots;
vec2 center = vec2(0, 0);

vec4 transition(vec2 uv) {
  bool nextImage = distance(fract(uv * dots), vec2(0.5, 0.5)) < ( progress / distance(uv, center));
  return nextImage ? getToColor(uv) : getFromColor(uv);
}

// ---- transition ----

void main() {
    gl_FragColor = transition(v_vTexcoord);
}
