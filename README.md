# prefab-transition

> [!WARNING]
> This requires a runner built on or after June 25th 2024 or an assertion will trigger about surface_set_target

Prefab for `room_goto_transition()` that captures the screen content in a surface, goes to the specified room, renders that room to a surface and uses the two surfaces to render a transition.
The transitions are MIT shaders from https://gl-transitions.com
