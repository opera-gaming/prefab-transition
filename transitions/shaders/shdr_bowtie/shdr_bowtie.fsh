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

uniform bool vertical;

float check(vec2 p1, vec2 p2, vec2 p3) {
    return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y);
}

bool PointInTriangle(vec2 pt, vec2 p1, vec2 p2, vec2 p3) {
    bool b1 = check(pt, p1, p2) < 0.0;
    bool b2 = check(pt, p2, p3) < 0.0;
    bool b3 = check(pt, p3, p1) < 0.0;
    return ((b1 == b2) && (b2 == b3));
}

bool in_horizontal_mask(vec2 p) {
    vec2 v1 = vec2(progress, 0.5);
    vec2 v2 = vec2(0.0, 0.5 - progress);
    vec2 v3 = vec2(0.0, 0.5 + progress);
    if (PointInTriangle(p, v1, v2, v3)) return true;

    v1 = vec2(1.0 - progress, 0.5);
    v2 = vec2(1.0, 0.5 - progress);
    v3 = vec2(1.0, 0.5 + progress);
    if (PointInTriangle(p, v1, v2, v3)) return true;

    return false;
}

bool in_vertical_mask(vec2 p) {
    vec2 v1 = vec2(0.5, progress);
    vec2 v2 = vec2(0.5 - progress, 0.0);
    vec2 v3 = vec2(0.5 + progress, 0.0);
    if (PointInTriangle(p, v1, v2, v3)) return true;

    v1 = vec2(0.5, 1.0 - progress);
    v2 = vec2(0.5 - progress, 1.0);
    v3 = vec2(0.5 + progress, 1.0);
    if (PointInTriangle(p, v1, v2, v3)) return true;

    return false;
}

vec4 transition(vec2 uv) {
    bool in_mask = vertical ? in_vertical_mask(uv) : in_horizontal_mask(uv);
    return in_mask ? getToColor(uv) : getFromColor(uv);
}


// ---- transition ----

void main() {
    gl_FragColor = transition(v_vTexcoord);
}
