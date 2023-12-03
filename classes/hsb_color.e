note
	description: "[
		A color describe using the Hue-Saturation-Brightness model.
		(This is same as HSL but I like the term "brightness" better
		than "lightness".)
		The model uses integal values instead of reals, except when
		converting from and to {EV_COLOR}.
		The `hue', `saturation', and `brightness' are {NATURAL_8} values.
		For ease of use, though, the setter feature take {INTEGER_32} values.
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
			out
		end

--	SAFE_DOUBLE_MATH

create
	default_create,
	set,
	set_with_ev_color,
	set_with_rgb

feature -- Access

	hue: NATURAL_8
			-- Describes the dominant color family of a spcific color.

	saturation: NATURAL_8
			-- The colorfullness relative to te brightness of a similarly
			-- illuminated white.
			-- Increasing values move the color towards a pure hue.

	brightness: NATURAL_8
			-- The brightness relative to the brightness of a similarly
			-- illuminated white.
			-- Increasing values move the color towards white

	Min_value: NATURAL_8 = 0
			-- The minimum value for the `hue', `saturation', and `lightness'

	Max_value: NATURAL_8 = 255
			-- The maximum value for the `hue', `saturation', and `lightness'

	name: STRING
			-- The name, if known, of Current; "Unknown" if not
		local
			f: HSB_COLOR_FACTORY
		do
			create f
			Result := f.name (Current)
		end

	complement: HSB_COLOR
			-- A color that is opposite hue
			-- Keep `saturation' the same.
		local
			h, s, b: NATURAL_8
		do
			h := hue + Max_value // 2
			s := saturation
			b := Max_value - brightness
			create Result.set (h, s, b)
		end

feature -- Element change

	set (a_hue, a_saturation, a_lightness: INTEGER)
			-- Change the corresponding attributes
		require
			valid_hue: a_hue >= Min_value and a_hue <= Max_value
			valid_saturation: a_saturation >= Min_value and a_saturation <= Max_value
			valid_lightness: a_lightness >= Min_value and a_lightness <= Max_value
		do
			set_hue (a_hue)
			set_saturation (a_saturation)
			set_brightness (a_lightness)
		end

	set_with_rgb (a_red, a_green, a_blue: REAL_32)
			-- Create and instance using RGB colors
			-- Color might be slightly off, because this creates an
			-- {EV_COLOR} then calls `set_with_ev_color'.  If Current
			-- is then converted to an EV_COLOR the result may be
			-- slightly different than expected due to rounding.
		require
			red_in_range: a_red >= 0 and then a_red <= 1
			green_in_range: a_green >= 0 and then a_green <= 1
			blue_in_range: a_blue >= 0 and then a_blue <= 1
		local
			c: EV_COLOR
		do
			create c.make_with_rgb (a_red, a_green, a_blue)
			set_with_ev_color (c)
		end

	set_with_ev_color (a_color: EV_COLOR)
			-- Create an instance equivalent to `a_color
		local
			h: REAL_32
		do
				-- No to the above.  The `saturation' and `lightness'
				-- values range from [0, 1], but the `hue' is given
				-- as a [SIC] "radiant that must be multiplied by 60
				-- to get degrees.  Instead I'll use EiffelSoftware's
				-- feature `hues_as_degrees' and convert that.
				-- The `hue', `saturation', and `lightness' from the
				-- {EV_COLOR} must be mapped to the range [0, 255]
			saturation := (a_color.saturation * Max_value).rounded.as_natural_8
			brightness := (a_color.lightness * Max_value).rounded.as_natural_8
				-- Now for the `hue'
			h := a_color.hue_as_degrees
			hue := (h / 360.0 * Max_value).rounded.as_natural_8
		ensure
				-- The post conditions need a rather large tolerance to allow
				-- for rounding when going from {REAL_32} to {INTEGER_32}
--			correct_red: very_close_with_tolerance (as_rgb.red, a_color.red, 0.02)
--			correct_green: very_close_with_tolerance (as_rgb.green, a_color.green, 0.02)
--			correct_blue: very_close_with_tolerance (as_rgb.blue, a_color.blue, 0.02)
		end

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

feature -- Basic operations

	add (a_other: HSB_COLOR)
			-- Modify Current by adding `a_other' to it
		local
			mid: NATURAL_8
		do
			hue := mid_value (hue, a_other.hue)
			--
			-- Example 1:  red + cyan would give white because cyan is
			--   a combiation of green and blue.  Red + Green + Blue is
			--   white.
			-- So, adding a complementary color (e.g. red + cyan) pulls
			-- the value towards the cyan along the EDGE of the color circle,
			-- -- not through the white middle.
			-- Problem:  which way to go?  do we get Violet or Chartreuse?
			--
		end

	sum alias "+" (a_other: HSB_COLOR): HSB_COLOR
			-- A new object that is the sum of Current and `a_other'
		do
			Result := twin
			Result.add (a_other)
		end

feature -- Query

	as_rgb: TUPLE [red, green, blue: REAL_32]
			-- The equivalent color in RGB format
			-- https://www.baeldung.com/cs/convert-color-hsl-rgb
		local
			h, sat, lit: REAL_64
			h_prime: REAL_64
			c, x, m: REAL_64
			r, g, b: REAL_64
--			r_int, g_int, b_int: INTEGER_32
			mod2: REAL_64
			i_value: INTEGER
		do
				-- Get values into interval [0, 1]
			sat := saturation / Max_value
			lit := brightness / Max_value
				-- Get `h' into interval [0, 360]
				-- Units for `h' is doobers so doobers X 360 degrees/255 doobers
			h := (hue * 360.0 / 255.0)
			h_prime := h / 60.0
				-- Compute the chroma, h-prime, and x
			c := (1 - (2 * lit - 1).abs) * sat
				-- get remainder of a real division for line:
				--    X = C * (1 - |H-prime mod 2 - 1)
				--    a % b = a - floor (a / b) * b
				--    5 % 7 = 5 - floor (5 / 7) * 7 = 5
			mod2 := h_prime - (h_prime / 2).floor * 2
			x := c * (1 - (mod2 - 1).abs)
				-- Get "face" that has the same hue and chroma
			check
				h_prime_positive: h_prime >= 0
					-- because `hue' is positive
			end
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
				-- Finish the Result
			Result := [r.truncated_to_real.max (0), g.truncated_to_real.max (0), b.truncated_to_real.max (0)]
		end

	as_ev_color: EV_COLOR
			-- Current converted to an {EV_COLOR}
		local
			tup: like as_rgb
		do
			tup := as_rgb
			create result.make_with_rgb (tup.red, tup.green, tup.blue)
		end

	to_grayscale
			-- Convert Current to its grayscale
			-- Uses the BT.709 formula.
		local
			tup: like as_rgb
			y_prime: REAL_32
		do
			tup := as_rgb
			y_prime := tup.red * 0.2126 + tup.green * 0.587 + tup.blue * 0.087
			set_with_rgb (y_prime, y_prime, y_prime)
		end

	as_grayscale: HSB_COLOR
			-- A new color that is the grayscale version of Current
		do
			Result := twin
			Result.to_grayscale
		end

feature -- Output

	out: STRING
			-- String representation of Current
		do
			Result := "HSB: (" + hue.out + ", " + saturation.out + ", " + brightness.out + ")"
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
			-- String representation in 8-bit RGB values
		local
			f: FORMAT_INTEGER
			r, g, b: STRING
			tup: like as_rgb
		do
			create f.make (3)
			f.no_justify
			tup := as_rgb
			r := f.formatted ((tup.red * 255).floor)
			g := f.formatted ((tup.green * 255).floor)
			b := f.formatted ((tup.blue * 255).floor)
			Result := "RGB: (" + r + ", " + g + ", " + b + ")"
		end

feature {NONE} -- Implementation

	mid_value (a_value, a_other: NATURAL_8): NATURAL_8
			-- The number half way between a_value and `a_other_value'.
			-- To accout for the colors arrange in a circle, translate the
			-- values so the larger is at `Max_value', add half the difference
			-- the shift the result back.
			-- This featue is used by `add'
		local
			min, max: NATURAL_8
			dist, min_dist, max_dist: NATURAL_8
			mid: NATURAL_8
		do
			min := a_value.min (a_other)
			max := a_value.max (a_other)
			dist := max - min
			min_dist := (max - min).min (min - max)
			max_dist := (max - min).max (min - max)
			mid := min_dist // 2


			if dist > Max_value // 2 then
				Result := max + mid
			else
				Result := min + mid
			end
		end

invariant

	valid_hue: hue >= Min_value and hue <= Max_value
	valid_saturation: saturation >= Min_value and saturation <= Max_value
	valid_lightness: brightness >= Min_value and brightness <= Max_value
end
