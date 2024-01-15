shader_type deferred_process;

void light() {
	if (LIGHT_IS_DIRECTIONAL) {
		vec3 z = normalize((INV_VIEW_MATRIX * vec4(LIGHT_DIR, 0.0)).xyz);
		if (dot(z, vec3(0.0, 0.0, -1.0)) <= -0.999) {
			LIGHT_COLOR = vec3(0.0, 1.0, 0.0);
		} else {
			LIGHT_COLOR = vec3(1.0, 0.0, 0.0);
		}
	}
}

void process() {
	// post_process
	 COLOR = vec3(1.0, 1.0, 1.0);
}
