note
	description: "[
		A color described using a modified Hue-Saturation-Brightness model.
		(This model is the same as HSL but I like the term "brightness" over
		"lightness".)  This class differs from HSL, because it defines attributes,
		`hue', `saturation', `brightness', and `alpha' as {NATURAL_8} numbers
		in the range [0, 255], while the HSL model gives these values in other
		ranges:  the hue range is [0.0, 360.0] in degrees, the saturation range is
		[0.0, 1.0], and the brightness/lightness range is normally [0.0, 1.0]. 
		
		To picture this HSL model, think of a sphere centered on the origin with
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
		  3) fix `complement' to account for colors with medium brightness, because the
		     the opposite of some colors can't be seen on the original color's background.
		     Needs a better formula.
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

--	SAFE_DOUBLE_MATH

create
	default_create,
	set,
	set_with_alpha,
	set_with_ev_color,
	set_with_rgb,
	set_with_rgb_and_alpha

feature {NONE} -- Implementation

	default_create
			-- Create an instance with all attributes set to zero.
			-- This will appear completely black
		do
			hue := Min_value
			saturation := Min_value
			brightness := Min_value
			alpha := Max_value
		ensure then
			is_red: hue = Min_value
			fully_saturated: saturation = Min_value
			mid_brightness: brightness = Min_value
			fully_opaque: alpha = Max_value
		end

	set (a_hue, a_saturation, a_brightness: INTEGER)
			-- Change the corresponding attributes
		require
			valid_hue: a_hue >= Min_value and a_hue <= Max_value
			valid_saturation: a_saturation >= Min_value and a_saturation <= Max_value
			valid_lightness: a_brightness >= Min_value and a_brightness <= Max_value
		do
			hue := a_hue.as_natural_8
			saturation := a_saturation.as_natural_8
			brightness := a_brightness.as_natural_8
			alpha := Max_value
		ensure
			hue_set: hue = a_hue
			saturation_set: saturation = a_saturation
			brightness_set: brightness = a_brightness
			fully_opaque: alpha = Max_value
		end

	set_with_alpha (a_hue, a_saturation, a_brightness, a_alpha: INTEGER)
			-- Change the corresponding attributes
		require
			valid_hue: a_hue >= Min_value and a_hue <= Max_value
			valid_saturation: a_saturation >= Min_value and a_saturation <= Max_value
			valid_lightness: a_brightness >= Min_value and a_brightness <= Max_value
			valid_alpha: a_alpha >= Min_value and a_alpha <= Max_value
		do
			set (a_hue, a_saturation, a_brightness)
			alpha := a_alpha.as_natural_8
		ensure
			hue_set: hue = a_hue
			saturation_set: saturation = a_saturation
			brightness_set: brightness = a_brightness
			alpha_set: alpha = a_alpha
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
			alpha := Max_value
		ensure
			fully_opaque: alpha = Max_value
		end

	set_with_rgb_and_alpha (a_red, a_green, a_blue, a_alpha: REAL_32)
			-- Create and instance using RGB colors
			-- Color might be slightly off, because this creates an
			-- {EV_COLOR} then calls `set_with_ev_color'.  If Current
			-- is then converted to an EV_COLOR the result may be
			-- slightly different than expected due to rounding.
		require
			red_in_range: a_red >= 0.0 and then a_red <= 1.0
			green_in_range: a_green >= 0.0 and then a_green <= 1.0
			blue_in_range: a_blue >= 0.0 and then a_blue <= 1.0
			alpha_in_range: a_alpha >= 0.0 and then a_alpha <= 1.0
		local
			c: EV_COLOR
		do
			set_with_rgb (a_red, a_green, a_blue)
			alpha := (Max_value * a_alpha).truncated_to_integer.as_natural_8
		end

	set_with_ev_color (a_color: EV_COLOR)
			-- Create an instance equivalent to `a_color
		local
			h: REAL_32
		do
				-- The `saturation' and `lightness' range is [0, 1],
				-- but the `hue' is given as a [SIC] "radiant that must
				-- be multiplied by 60 to get degrees.  Instead I'll use
				-- EiffelSoftware's feature `hues_as_degrees' and convert
				-- that.  The `hue', `saturation', and `lightness' from
				-- the {EV_COLOR} must be mapped to the range [0, 255]
			saturation := (a_color.saturation * Max_value).rounded.as_natural_8
			brightness := (a_color.lightness * Max_value).rounded.as_natural_8
				-- Now for the `hue'
			h := a_color.hue_as_degrees
			hue := (h / 360.0 * Max_value).rounded.as_natural_8
			alpha := Max_value
		ensure
				-- The post conditions need a rather large tolerance to allow
				-- for rounding when going from {REAL_32} to {INTEGER_32}
--			correct_red: very_close_with_tolerance (as_rgb.red, a_color.red, 0.02)
--			correct_green: very_close_with_tolerance (as_rgb.green, a_color.green, 0.02)
--			correct_blue: very_close_with_tolerance (as_rgb.blue, a_color.blue, 0.02)
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
			-- Measure of transparancy, when `blended' with another color,
			-- where `Min_value' is totally transparent and `Max_value' is opaque.

	Min_value: NATURAL_8 = 0
			-- The minimum value for the `hue', `saturation', and `lightness'

	Max_value: NATURAL_8 = 255
			-- The maximum value for the `hue', `saturation', and `lightness'

	Mid_value: INTEGER = 128
			-- The middle value of the interval:
			--   [{HSB_COLOR}.Min_value, {HSB_COLOR}.Max_value]

	name: STRING
			-- The name, if known, of Current; "Unknown" if not
		local
			f: HSB_COLOR_FACTORY
		do
			create f
			Result := f.name (Current)
		end

	complement: HSB_COLOR
			-- A color that is opposite `hue'
			-- Keep `saturation' the same.
		local
			h, s, b: NATURAL_8
		do
			h := hue + Max_value // 2
			s := saturation
			b := Max_value - brightness
			create Result.set (h, s, b)
		end

feature -- Basic operations

	over (a_other: HSB_COLOR): HSB_COLOR
			-- A new color resulting by alpha-blending the
			-- placement of Current over `a_other', using the
			-- NON-premultiplied alpha equations from:
			-- https://en.wikipedia.org/wiki/Alpha_compositing#Alpha_blending
		local
			rgb, other_rgb: like as_rgba
			r, g, b, a: REAL_32
		do
				-- This implementation uses RGB values.
			rgb := as_rgba
			other_rgb := a_other.as_rgba
				-- If using premultiplied alpha in `as_rgba'
--			r := blended (rgb.red, other_rgb.red, rgb.alpha)
--			g := blended (rgb.green, other_rgb.green, rgb.alpha)
--			b := blended (rgb.blue, other_rgb.blue, rgb.alpha)
--			a := rgb.alpha + other_rgb.alpha * (1 - rgb.alpha)
				-- Using the straight-alpha formula
			r := blended (rgb.red, other_rgb.red, rgb.alpha, other_rgb.alpha)
			g := blended (rgb.green, other_rgb.green, rgb.alpha, other_rgb.alpha)
			b := blended (rgb.blue, other_rgb.blue, rgb.alpha, other_rgb.alpha)
			a := rgb.alpha + other_rgb.alpha * (1 - rgb.alpha)
				-- Finish the straight-alpha formula with the division
			if a > 0.0 then
				r := r / a
				g := g / a
				b := b / a
			end
			create Result.set_with_rgb_and_alpha (r, g, b, a)
		end

	hsb_over (a_other: HSB_COLOR): HSB_COLOR
			-- Attempt to find formula using `hue', `saturation', `brightness',
			-- and `alpha' directly instead of converting to RGB values.
		obsolete
			"Not implemented, use `over' instead."
		do
				-- Appease Void-safety
			create Result
				-- Make it not usable
--			check
--				do_not_call: false
--					-- because I don't think this is worth implementing.
--					-- See "Implementing Over in HSB" in the documentation folder.
--			end
		end

	sum alias "+"(a_other: HSB_COLOR): like Current
			-- A new "pure" (i.e. fully saturated and medium brightness) color
			-- whose `hue' is halfway between the `hue' of Current and `a_other'.
		local
			h: NATURAL_8
		do
			h := between_value (hue, a_other.hue)
				-- Example 1:  red + yellow = orange, but
				-- Example 2:  red + cyan would give white if we were combining
				-- light because cyan is a combination of green and blue.
				-- Red + Green + Blue = White.
				-- But, this class will restrict the result to go around the edge
				-- of the color circle not through the middle where `unsaturated'
				-- (i.e. white) colors lie.  Adding a complementary color such as
				-- adding cyan to red pulls the `hue' around the circle towards
				-- the cyan which is 180-degree out.
				-- Problem:  which way to go?  do we get Violet or Chartreuse?
			create Result.set (h, Max_value, Mid_value)
		end

feature -- Query

	as_rgba: TUPLE [red, green, blue, alpha: REAL_32]
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
--				-- Pre-multiply by the `alpha'
			a := alpha / Max_value
--			r := r * a
--			g := g * a
--			b := b * a
				-- Finish the Result
			Result := [r.truncated_to_real.max (0), g.truncated_to_real.max (0),
					 b.truncated_to_real.max (0), a.truncated_to_real.max (0)]
		end

	as_ev_color: EV_COLOR
			-- Current converted to an {EV_COLOR}
		local
			tup: like as_rgba
		do
			tup := as_rgba
			create result.make_with_rgb (tup.red, tup.green, tup.blue)
		end

	as_grayscale: HSB_COLOR
			-- A new color that is the grayscale version of Current
		local
			tup: like as_rgba
			y_prime: REAL_32
		do
			tup := as_rgba
			y_prime := tup.red * 0.2126 + tup.green * 0.587 + tup.blue * 0.087
			create Result.set_with_rgb (y_prime, y_prime, y_prime)
		end

	as_mutable: MUTABLE_HSB_COLOR
			-- A copy of Current that can be changed
		do
			create Result.set (hue, saturation, brightness)
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
			Result := "HSB: (" + h + "�, " + s + "%%, " + b + "%%)"
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

	blended (a_value, a_other_value, a_alpha, a_other_alpha: REAL): REAL
			-- Alpha blending of one channel (a_value over a_other_value)
			-- Implements the straight-alpha formula.
			-- Feature called by `over', which uses RGB values.
		require
			value_big_enough: a_value >= 0.0
			value_small_enough: a_value <= 1.0
			other_value_big_enough: a_other_value >= 0.0
			other_value_small_enough: a_other_value <= 1.0
			alpha_big_enough: a_alpha >= 0.0
			alpha_small_enough: a_alpha <= 1.0
		do
					-- commented line is the premultiplied-alpha formula
--			Result := a_value * a_other_value * (1 - a_alpha)
			Result := (a_value * a_alpha + a_other_value * a_other_alpha * (1 - a_alpha))
		end

	between_value (a_value, a_other: NATURAL_8): NATURAL_8
			-- The number half way between a_value and `a_other_value'.
			-- To account for the colors arranged in a circle, translate the
			-- values so the larger is at `Max_value', add half the difference,
			-- the shift the result back.
			-- This feature is used by `add'
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
	valid_alpha: alpha >= Min_value and alpha <= Max_value

end
