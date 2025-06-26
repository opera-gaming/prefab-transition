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

uniform vec3 color;// = vec3(0.0)
uniform float color_phase/* = 0.4 */; // if 0.0, there is no black phase, if 0.9, the black phase is very important
vec4 transition (vec2 uv) {
  return mix(
    mix(vec4(color, 1.0), getFromColor(uv), smoothstep(1.0-color_phase, 0.0, progress)),
    mix(vec4(color, 1.0), getToColor(uv), smoothstep(    color_phase, 1.0, progress)),
    progress);
}

// ---- transition ----

void main() {
    gl_FragColor = transition(v_vTexcoord);
}
