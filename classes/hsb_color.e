note
	description: "[
		A color described using a modified Hue-Saturation-Brightness model.
		(This model is the same as HSL but I like the term "brightness" over
		"lightness".)  This class differs from HSL, because it defines attributes,
		`hue', `saturation', `brightness', and `alpha' as {NATURAL_8} numbers
		in the range [0, 255], while the HSL model gives these values in other
		ranges:  the hue range is [0.0, 360.0] in degrees, the saturation range is
		[0.0, 1.0], and the brightness/lightness range is normally [0.0, 1.0]. 
		
		To picture this HSB model, think of a sphere centered on the origin with
		a radius measured in units scaled to fit 360 degrees into a NATURAL_8 number),
		where:
			1) `hue' - the particular color given by the degrees from the red-axis,
			   where red is at 0 units, progressing through yellow at 43 units
			   (60-degrees), green is at 85 units (120 degrees), cyan is at 128
			   units (180 degrees), blue is at 170 units (240 degrees), Magenta
			   is at 213 units (300 degrees), with tertiary and other colors
			   spaced accordingly.
			2) `saturation' - the amount of a given color measured as the distance
			   from the origin towards the edge of the sphere. (A fully saturated
			   red is on the sphere while a less saturated red would be somewhere
			   inside the sphere.)  As the `saturation' approaches zero, the color
			   appears more and more white.
			3) `brightness' - the way a color appears relative to white is the angle
			   in units measured up from the negative z-axis, with zero units
			   (0 degrees or straight down) appearing totally black/dark, 128 units
			   (90 degrees or on the sphere's equator) is a "pure" color, and 255
			   units (180 degrees, or straight up) appears totally bright/white.
			4) Alpha - the transparency, ranges from zero units (totally transparent)
			   to 255 units (totally opaque).

		To display an {HSB_COLOR} using the EV_xxx classes of EiffelVision, obtain the
		equivalent {EV_COLOR} with feature `as_ev_color'.

		An {HSB_COLOR} is immutable (i.e. it has no setters beyond the creation features).
		Obtain a modifiable {MUTABLE_HSB_COLOR} with feature `as_mutable'.

		ToDo:
		  1) fix `name' to search {HTML_EXTENDED_COLORS}
		  2) add color tables such as `red_colors', `orange_colors', etc to
		     class {HTML_EXTENDED_COLORS}
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/23"
	copyright: "Copyright (c) 2023, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	HSB_COLOR

inherit

	ANY
		redefine
			default_create,
			out
		end

inherit {NONE}

	SAFE_DOUBLE_MATH
		undefine
			default_create,
			out
		end

create
	default_create,
	make,
	make_with_alpha,
	make_with_rgb,
	make_with_rgba

feature {NONE} -- Implementation

	default_create
			-- Create an opaque black color.
		do
			alpha := Max_value
		ensure then
			default_hue: hue = Min_value
			no_saturation: saturation = Min_value
			is_black: brightness = Min_value
			fully_opaque: alpha = Max_value
		end

	make (a_hue, a_saturation, a_brightness: INTEGER)
			-- Create an opaque color, setting the HSB attributes.
		require
			valid_hue: a_hue >= Min_value and a_hue <= Max_value
			valid_saturation: a_saturation >= Min_value and a_saturation <= Max_value
			valid_brightness: a_brightness >= Min_value and a_brightness <= Max_value
		do
			hue := a_hue.as_natural_8
			saturation := a_saturation.as_natural_8
			brightness := a_brightness.as_natural_8
			alpha := Max_value
		ensure
			hue_set: hue = a_hue
			saturation_set: saturation = a_saturation
			brightness_set: brightness = a_brightness
			alpha_set: alpha = Max_value
		end

	make_with_alpha (a_hue, a_saturation, a_brightness, a_alpha: INTEGER)
			-- Create an instance, setting the HSB attributes and alpha
		require
			valid_hue: a_hue >= Min_value and a_hue <= Max_value
			valid_saturation: a_saturation >= Min_value and a_saturation <= Max_value
			valid_brightness: a_brightness >= Min_value and a_brightness <= Max_value
			valid_alpha: a_alpha >= Min_value and a_alpha <= Max_value
		do
			hue := a_hue.as_natural_8
			saturation := a_saturation.as_natural_8
			brightness := a_brightness.as_natural_8
			alpha := a_alpha.as_natural_8
		ensure
			hue_set: hue = a_hue
			saturation_set: saturation = a_saturation
			brightness_set: brightness = a_brightness
			alpha_set: alpha = a_alpha
		end

	make_with_rgb (a_red, a_green, a_blue: REAL_64)
			-- Create an instance, using the RGB values
		require
			valid_red: a_red >= 0 and then a_red <= 1
			valid_green: a_green >= 0 and then a_green <= 1
			valid_blue: a_blue >= 0 and then a_blue <= 1
		local
			diff_color: REAL_64
			max_color: REAL_64
			min_color: REAL_64
			sum_color: REAL_64
			r, g, b: REAL_64
			tmp: REAL_64
		do
			default_create
			r := a_red
			g := a_green
			b := a_blue
			max_color := r.max(g).max(b)
			min_color := r.min(g).min(b)
			diff_color := max_color - min_color
				-- Calculate brightness
			tmp := (max_color + min_color) / 2
			brightness := (tmp * Max_value).rounded.as_natural_8
				-- Calculate `saturation'		
			if diff_color = 0.0 then
				tmp := 0.0
			else
				sum_color := max_color + min_color
				if sum_color < 1 then
					tmp := diff_color / sum_color
				else
					tmp := diff_color / (2.0 - sum_color)
				end
			end
			saturation := (tmp * Max_value).rounded.as_natural_8
				-- Calculate `hue'
			if diff_color = 0.0 then
				tmp := 0.0
			else
				if max_color = r then
					tmp := (g - b) / diff_color
					if tmp < 0.0 then
						tmp := tmp + 6.0
					end
				elseif max_color = g then
					tmp := 2.0 + ((b - r) / diff_color)
				else
					tmp := 4.0 + ((r - g) / diff_color)
				end
			end
			hue := (tmp * Max_value / 6.0).rounded.as_natural_8
		ensure
				-- Tolerance value provided by ChatGPT.
				-- "The 8-bit hue conversion is the largest source of error. Saturation and
				-- brightness quantization contribute additional error. Sampling the round-trip
				-- conversion gives a worst channel error of about 0.0157; 0.017 provides a
				-- small margin for REAL_32 arithmetic.  Use absolute tolerance."
			correct_red: (as_rgba.red - a_red).abs <= 0.017
			correct_green: (as_rgba.green - a_green).abs <= 0.017
			correct_blue: (as_rgba.blue - a_blue).abs <= 0.017
			fully_opaque: alpha = Max_value
		end

	make_with_rgba (a_red, a_green, a_blue, a_alpha: REAL_64)
			-- Create an instance, using the RGB values and `a_alpha'
		require
			valid_red: a_red >= 0 and then a_red <= 1
			valid_green: a_green >= 0 and then a_green <= 1
			valid_blue: a_blue >= 0 and then a_blue <= 1
			valid_alpha: a_alpha >= 0 and then a_alpha <= 1
		do
			make_with_rgb (a_red, a_green, a_blue)
				-- Calculate `alpha'
			alpha := (Max_value * a_alpha).rounded.as_natural_8
		ensure
				-- Tolerance value provided by ChatGPT.
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

feature -- Access

	hue: NATURAL_8
			-- Describes the dominant color family of a spcific color.

	saturation: NATURAL_8
			-- The colorfulness relative to the brightness of a similarly
			-- illuminated white.
			-- Increasing values move the color towards a pure hue.

	brightness: NATURAL_8
			-- The brightness relative to the brightness of a similarly
			-- illuminated white.
			-- Increasing values move the color towards white

	alpha: NATURAL_8
			-- Measure of opacity, when `blended' with another color,
			-- where `Min_value' is totally transparent and `Max_value'
			-- is totally opaque.

	Min_value: NATURAL_8 = 0
			-- The minimum value for the `hue', `saturation', and `lightness'

	Max_value: NATURAL_8 = 255
			-- The maximum value for the `hue', `saturation', and `lightness'

	Mid_value: NATURAL_8 = 128
			-- The middle value of the interval:
			--   [{HSB_COLOR}.Min_value, {HSB_COLOR}.Max_value]

	name: STRING
			-- The name, if known, of Current; "Unknown" if not
		local
			f: RGB_COLORS
			f2: HTML_EXTENDED_COLORS
		do
			create f
			Result := f.name (Current)
		end

	complement: HSB_COLOR
			-- A color with the opposite hue and complementary brightness.
			-- Keep `saturation' and `alpha' the same.
		local
			h: INTEGER
			s, b: NATURAL_8
		do
				-- Use INTEGER arithmetic to avoid NATURAL_8 overflow.
			h := (hue.to_integer_32 + Mid_value.to_integer_32) \\ (Max_value.to_integer_32 + 1)
			s := saturation
			b := Max_value - brightness
			create Result.make_with_alpha (h, s, b, alpha)
		ensure
			alpha_unchanged: alpha = old alpha
		end

feature -- Basic operations

	over (a_other: HSB_COLOR): HSB_COLOR
			-- A new color resulting from compositing Current over `a_other'
			-- using Porter-Duff source-over compositing, performed in
			-- linear-light RGB with sRGB input and output.
			-- See:
			--     https://www.w3.org/TR/compositing-1/?utm_source=chatgpt.com
			--     https://github-wiki-see.page/m/obsproject/obs-studio/wiki/Linear-Color-Blending?utm_source=chatgpt.com
			--     https://ciechanow.ski/alpha-compositing/?utm_source=chatgpt.com
		local
			rgb, other_rgb: like as_rgba
			r, g, b, output_alpha: REAL_64
			foreground_alpha, background_alpha: REAL_64
		do
			rgb := as_rgba
			other_rgb := a_other.as_rgba
			foreground_alpha := rgb.alpha
			background_alpha := other_rgb.alpha
				-- Compute the output alpha using the source-over equation.
			output_alpha := foreground_alpha + background_alpha * (1.0 - foreground_alpha)
			if output_alpha > 0.0 then
					-- Convert the RGB channels to linear light before blending.
						-- red
				r := srgb_to_linear (rgb.red)
				r := (r * foreground_alpha + srgb_to_linear (other_rgb.red) *
								background_alpha * (1.0 - foreground_alpha)) / output_alpha
						-- green
				g := srgb_to_linear (rgb.green)
				g := (g * foreground_alpha + srgb_to_linear (other_rgb.green) *
								background_alpha * (1.0 - foreground_alpha)) / output_alpha
						-- blue
				b := srgb_to_linear (rgb.blue)
				b := (b * foreground_alpha + srgb_to_linear (other_rgb.blue) *
								background_alpha * (1.0 - foreground_alpha)) / output_alpha
					-- Convert the blended channels back to sRGB.
				r := linear_to_srgb (r)
				g := linear_to_srgb (g)
				b := linear_to_srgb (b)
			else
					-- Preserve Current's RGB values when the result is transparent.
				r := rgb.red
				g := rgb.green
				b := rgb.blue
			end
			create Result.make_with_rgba (r, g, b, output_alpha)
		end

feature -- Query

	as_rgba: TUPLE [red, green, blue, alpha: REAL_64]
			-- The red, green, blue, and alpha values as reals
			-- https://www.baeldung.com/cs/convert-color-hsl-rgb
		local
			h, sat, lit: REAL_64
			h_prime: REAL_64
			c, x, m: REAL_64
			r, g, b, a: REAL_64
			mod2: REAL_64
			i_value: INTEGER
		do
				-- Get values into interval [0, 1]
			sat := saturation / Max_value
			lit := brightness / Max_value
				-- Get `h' into interval [0, 360]
			h := (hue * 360.0 / 255.0)
			h_prime := h / 60.0
				-- Compute the chroma, h-prime, and x
			c := (1 - (2 * lit - 1).abs) * sat
				-- get remainder of a real division for line:
			mod2 := h_prime - (h_prime / 2).floor * 2
			x := c * (1 - (mod2 - 1).abs)
				-- Get "face" that has the same hue and chroma
			i_value := h_prime.floor
			inspect i_value
			when 0, 6 then
				r := c
				g := x
				b := 0
			when 1 then
				r := x
				g := c
				b := 0
			when 2 then
				r := 0
				g := c
				b := x
			when 3 then
				r := 0
				g := x
				b := c
			when 4 then
				r := x
				g := 0
				b := c
			when 5 then
				r := c
				g := 0
				b := x
			else
				check
					should_not_happend: False
						-- because `hue' was between 0 and Max_value
				end
			end
				-- Account for lightness
			m := lit - c/2
			r := r + m
			g := g + m
			b := b + m
				-- Do not pre-multiply rgb values, because that is expected by `over'
			a := alpha / Max_value
				-- Finish the Result
			Result := [r.max (0), g.max (0), b.max (0), a.max (0), a]
		end

	as_grayscale: HSB_COLOR
			-- A new color that is the grayscale version of Current
		local
			tup: like as_rgba
			y_prime: REAL_64
		do
			tup := as_rgba
				-- Use the Rec. 709 coefficients:
			y_prime := tup.red * 0.2126 + tup.green * 0.7152 + tup.blue * 0.0722
			create Result.make_with_rgba (y_prime, y_prime, y_prime, tup.alpha)
		ensure
			gray_red_equals_green: close_enough (Result.as_rgba.red, Result.as_rgba.green)
			gray_green_equals_blue: close_enough (Result.as_rgba.green, Result.as_rgba.blue)
			alpha_preserved: Result.alpha = alpha
				-- The 0.002 tolerance accounts for quantization when converting the
				-- grayscale value to 8-bit HSB attributes and back to RGB.  The value 0.002
				-- is an absolute tolerance, therefor subtraction is used.
			correct_grayscale_intensity: (Result.as_rgba.red -
				(as_rgba.red * 0.2126 + as_rgba.green * 0.7152 + as_rgba.blue * 0.0722)) <= 0.002
		end

	as_mutable: MUTABLE_HSB_COLOR
			-- A copy of Current that can be changed
		do
			create Result.make_with_alpha (hue, saturation, brightness, alpha)
		ensure
			correct_hue: Result.hue = hue
			correct_saturation: Result.saturation = saturation
			correct_brightness: Result.brightness = brightness
			correct_alpha: Result.alpha = alpha
		end

feature -- Output

	out: STRING
			-- String representation of Current
		do
			Result := "HSB: (" + hue.out + ", " + saturation.out + ", " + brightness.out + ", " + alpha.out + ")"
		end

	out_in_degrees: STRING
			-- String representation of Current in degrees and percent
		local
			f: FORMAT_DOUBLE
			h, s, b: STRING
		do
			create f.make (5, 1)
			h := f.formatted (hue * 360 / 255)
			s := f.formatted (saturation / 255 * 100)
			b := f.formatted (brightness / 255 * 100)
			Result := "HSB: (" + h + "°, " + s + "%%, " + b + "%%)"
		end

	out_in_rgb: STRING
			-- String representation in 8-bit RGB values (pre-multiplied)
		local
			f: FORMAT_INTEGER
			r, g, b, a: STRING
			tup: like as_rgba
		do
			create f.make (3)
			f.no_justify
			tup := as_rgba
			r := f.formatted ((tup.red * 255).floor)
			g := f.formatted ((tup.green * 255).floor)
			b := f.formatted ((tup.blue * 255).floor)
			a := f.formatted ((tup.alpha * 255).floor)
			Result := "RGB: (" + r + ", " + g + ", " + b + ", " + a +")"
		end

feature {NONE} -- Implementation

	srgb_to_linear (a_value: REAL_64): REAL_64
			-- Convert an sRGB channel value to linear light.
		require
			valid_value: a_value >= 0.0 and a_value <= 1.0
		do
			if a_value <= 0.04045 then
				Result := a_value / 12.92
			else
					-- Apply the nonlinear segment of the sRGB transfer function.
				Result := ((a_value + 0.055) / 1.055) ^ 2.4
			end
		end

	linear_to_srgb (a_value: REAL_64): REAL_64
			-- Convert a linear-light channel value to sRGB.
		require
			valid_value: a_value >= 0.0 and a_value <= 1.0
		do
			if a_value <= 0.0031308 then
				Result := 12.92 * a_value
			else
					-- Apply the nonlinear segment of the inverse sRGB transfer function.
				Result := 1.055 * (a_value ^ (1.0 / 2.4)) - 0.055
			end
		end

invariant

	valid_hue: hue >= Min_value and hue <= Max_value
	valid_saturation: saturation >= Min_value and saturation <= Max_value
	valid_brightness: brightness >= Min_value and brightness <= Max_value
	valid_alpha: alpha >= Min_value and alpha <= Max_value

end
