note
	description: "[
		An {HSB_COLOR} that can be modified.
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/213"
	copyright: "Copyright (c) 2023, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	MUTABLE_HSB_COLOR

inherit

	HSB_COLOR
		export
			{ANY}
				set,
				set_with_alpha,
				set_with_rgb,
				set_with_ev_color
		end

create
	default_create,
	set,
	set_with_alpha,
	set_with_ev_color,
	set_with_rgb,
	set_with_rgb_and_alpha

feature -- Element change

	set_hue (a_value: INTEGER)
			-- Change the `hue'
		require
			value_big_enough: a_value >= Min_value
			value_small_enough: a_value <= Max_value
		do
			hue := a_value.as_natural_8
		end

	set_saturation (a_value: INTEGER)
			-- Change the `saturation'
		require
			value_big_enough: a_value >= Min_value
			value_small_enough: a_value <= Max_value
		do
			saturation := a_value.as_natural_8
		end

	set_brightness (a_value: INTEGER)
			-- Change the `lightness'
		require
			value_big_enough: a_value >= Min_value
			value_small_enough: a_value <= Max_value
		do
			brightness := a_value.as_natural_8
		end

	set_alpha (a_value: INTEGER)
		require
			value_big_enough: a_value >= Min_value
			value_small_enough: a_value <= Max_value
		do
			alpha := a_value.as_natural_8
		end

feature -- Basic operations

	to_grayscale
			-- Convert Current to its grayscale
			-- Uses the BT.709 formula.
		local
			tup: like as_rgba
			y_prime: REAL_32
		do
			tup := as_rgba
			y_prime := tup.red * 0.2126 + tup.green * 0.587 + tup.blue * 0.087
			set_with_rgb (y_prime, y_prime, y_prime)
		end

	add (a_other: HSB_COLOR)
			-- A new object that is the sum of Current and `a_other'
		local
			c: HSB_COLOR
		do
			copy (Current.sum (a_other))
		end


end
