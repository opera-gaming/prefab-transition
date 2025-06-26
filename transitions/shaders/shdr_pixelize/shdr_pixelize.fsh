uniform sampler2D from_tex;
uniform sampler2D to_tex;
uniform float progress;

varying vec2 v_vTexcoord;

vec4 getToColor(vec2 uv) {
    return texture2D(to_tex, vec2(uv.x, 1.0-uv.y));
}

vec4 getFromColor(vec2 uv) {
    return texture2D(from_tex, vec2(uv.x, 1.0-uv.y));
}

// ---- transition -----

uniform vec2 squares_min/* = ivec2(20) */; // minimum number of squares (when the effect is at its higher level)
uniform int steps /* = 50 */; // zero disable the stepping

float d = min(progress, 1.0 - progress);
float dist = steps>0 ? ceil(d * float(steps)) / float(steps) : d;
vec2 squareSize = 2.0 * dist / vec2(squares_min);

vec4 transition(vec2 uv) {
  vec2 p = dist>0.0 ? (floor(uv / squareSize) + 0.5) * squareSize : uv;
  return mix(getFromColor(p), getToColor(p), progress);
}


// ---- transition ----

void main() {
    gl_FragColor = transition(v_vTexcoord);
}
