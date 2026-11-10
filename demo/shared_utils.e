note
	description: "[
		Some useful features not belonging in any other class.
		]"
	author: "Jimmy J Johnson"
	date: "11/8/216"

class
	SHARED_UTILS

feature -- Basic operations

	as_ev_color (a_hsb_color: HSB_COLOR): EV_COLOR
			-- Convert `a_hsb_color' to an {EV_COLOR}
		local
			tup: TUPLE [red, green, blue, alpha: REAL_64]
		do
			tup := a_hsb_color.as_rgba
			create Result.make_with_rgb (tup.red.truncated_to_real,
															 tup.green.truncated_to_real,
															 tup.blue.truncated_to_real)
		end

end
