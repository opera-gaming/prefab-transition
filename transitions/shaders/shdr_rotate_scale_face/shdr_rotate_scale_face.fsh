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

#define PI 3.14159265359

uniform vec2 center; // = vec2(0.5, 0.5);
uniform float rotations; // = 1;
uniform float scale; // = 8;
uniform vec4 back_color; // = vec4(0.15, 0.15, 0.15, 1.0);

vec4 transition (vec2 uv) {
  
  vec2 difference = uv - center;
  vec2 dir = normalize(difference);
  float dist = length(difference);
  
  float angle = 2.0 * PI * rotations * progress;
  
  float c = cos(angle);
  float s = sin(angle);
  
  float currentScale = mix(scale, 1.0, 2.0 * abs(progress - 0.5));
  
  vec2 rotatedDir = vec2(dir.x  * c - dir.y * s, dir.x * s + dir.y * c);
  vec2 rotatedUv = center + rotatedDir * dist / currentScale;
  
  if (rotatedUv.x < 0.0 || rotatedUv.x > 1.0 ||
      rotatedUv.y < 0.0 || rotatedUv.y > 1.0)
    return back_color;
    
  return mix(getFromColor(rotatedUv), getToColor(rotatedUv), progress);
}

// ---- transition ----

void main() {
    gl_FragColor = transition(v_vTexcoord);
}
