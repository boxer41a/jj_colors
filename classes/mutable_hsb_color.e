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

create
	default_create,
	make,
	make_with_alpha,
	make_with_rgb,
	make_with_rgba

feature -- Element change

	set (a_hue, a_saturation, a_brightness: INTEGER)
			-- Change the corresponding attributes
		require
			valid_hue: a_hue >= Min_value and a_hue <= Max_value
			valid_saturation: a_saturation >= Min_value and a_saturation <= Max_value
			valid_brightness: a_brightness >= Min_value and a_brightness <= Max_value
		do
			hue := a_hue.as_natural_8
			saturation := a_saturation.as_natural_8
			brightness := a_brightness.as_natural_8
		ensure
			hue_set: hue = a_hue
			saturation_set: saturation = a_saturation
			brightness_set: brightness = a_brightness
			alpha_unchanged: alpha = old alpha
		end

	set_with_alpha (a_hue, a_saturation, a_brightness, a_alpha: INTEGER)
			-- Create an instance, setting the HSB attributes and alpha
		require
			valid_hue: a_hue >= Min_value and a_hue <= Max_value
			valid_saturation: a_saturation >= Min_value and a_saturation <= Max_value
			valid_brightness: a_brightness >= Min_value and a_brightness <= Max_value
			valid_alpha: a_alpha >= Min_value and a_alpha <= Max_value
		do
			make_with_alpha (a_hue, a_saturation, a_brightness, a_alpha)
		ensure
			hue_set: hue = a_hue
			saturation_set: saturation = a_saturation
			brightness_set: brightness = a_brightness
			alpha_set: alpha = a_alpha
		end

	set_with_rgb (a_red, a_green, a_blue: REAL_64)
			-- Set Current using RGB channel values.
			-- RGB values may differ slightly from the arguments because
			-- of quantization when converting to 8-bit HSB attributes.
		require
			red_in_range: a_red >= 0 and then a_red <= 1
			green_in_range: a_green >= 0 and then a_green <= 1
			blue_in_range: a_blue >= 0 and then a_blue <= 1
		local
			old_a: NATURAL_8
		do
			old_a := alpha
			make_with_rgb (a_red, a_green, a_blue)
			alpha := old_a
		ensure
			alpha_unchanged: alpha = old alpha
				-- Tolerance value provided by ChatGPT.
				-- "The 8-bit hue conversion is the largest source of error. Saturation and
				-- brightness quantization contribute additional error. Sampling the round-trip
				-- conversion gives a worst channel error of about 0.0157; 0.017 provides a
				-- small margin for REAL_32 arithmetic.  Use absolute tolerance."
			correct_red: (as_rgba.red - a_red).abs <= 0.017
			correct_green: (as_rgba.green - a_green).abs <= 0.017
			correct_blue: (as_rgba.blue - a_blue).abs <= 0.017
		end

	set_with_rgba (a_red, a_green, a_blue, a_alpha: REAL_64)
			-- Set Current using RGB channel values.
			-- RGB values may differ slightly from the arguments because
			-- of quantization when converting to 8-bit HSB attributes.
		require
			red_in_range: a_red >= 0 and then a_red <= 1
			green_in_range: a_green >= 0 and then a_green <= 1
			blue_in_range: a_blue >= 0 and then a_blue <= 1
			valid_alpha: a_alpha >= 0 and then a_alpha <= 1
		do
			make_with_rgba (a_red, a_green, a_blue, a_alpha)
		ensure
			alpha_unchanged: alpha = old alpha
				-- Tolerence value provided by ChatGPT.
				-- "The 8-bit hue conversion is the largest source of error. Saturation and
				-- brightness quantization contribute additional error. Sampling the round-trip
				-- conversion gives a worst channel error of about 0.0157; 0.017 provides a
				-- small margin for REAL_32 arithmetic.  Use absolute tolerance."
			correct_red: (as_rgba.red - a_red).abs <= 0.017
			correct_green: (as_rgba.green - a_green).abs <= 0.017
			correct_blue: (as_rgba.blue - a_blue).abs <= 0.017
				-- Alpha is quantized directly to 256 values, so rounding introduces a
				-- maximum absolute error of half a step:   0.5 / 255 ~ 0.001961
			correct_alpha: (as_rgba.alpha - a_alpha).abs <= (0.5 / 255.0)
		end

	set_hue (a_value: INTEGER)
			-- Change the `hue'
		require
			value_big_enough: a_value >= Min_value
			value_small_enough: a_value <= Max_value
		do
			hue := a_value.as_natural_8
		ensure
			hue_set: hue = a_value
		end

	set_saturation (a_value: INTEGER)
			-- Change the `saturation'
		require
			value_big_enough: a_value >= Min_value
			value_small_enough: a_value <= Max_value
		do
			saturation := a_value.as_natural_8
		ensure
			saturation_set: saturation = a_value
		end

	set_brightness (a_value: INTEGER)
			-- Change the `brightness'
		require
			value_big_enough: a_value >= Min_value
			value_small_enough: a_value <= Max_value
		do
			brightness := a_value.as_natural_8
		ensure
			brightness_set: brightness = a_value
		end

	set_alpha (a_value: INTEGER)
			-- Change `alpha'
		require
			value_big_enough: a_value >= Min_value
			value_small_enough: a_value <= Max_value
		do
			alpha := a_value.as_natural_8
		ensure
			alpha_set: alpha = a_value
		end

feature -- Basic operations

	to_grayscale
			-- Convert Current to its grayscale
			-- Uses the BT.709 formula.
		local
			tup: like as_rgba
			y_prime: REAL_64
		do
			tup := as_rgba
			y_prime := tup.red * 0.2126 + tup.green * 0.587 + tup.blue * 0.087
			set_with_rgb (y_prime, y_prime, y_prime)
		end

end
