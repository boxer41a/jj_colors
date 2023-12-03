note
	description: "[
		A {VIEW} that shows the result of adding one {HSB_COLOR}
		to another.
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/23"
	copyright: "Copyright (c) 2023, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	HSB_COLOR_SUMMATIONS_VIEW

inherit

	EV_MODEL_WORLD_CELL
		redefine
			create_interface_objects,
			initialize
		end

feature {NONE} -- Initialization

	create_interface_objects
			-- Create objects to be used by `Current' in `initialize'
			-- Implemented by descendants to create attached objects
			-- in order to adhere to void-safety due to the implementation bridge pattern.
		do
				-- Must create `world' because not calling `make_with_world'
			create world
			Precursor {EV_MODEL_WORLD_CELL}
		end

	initialize
			-- Set up the view
		do
			Precursor {EV_MODEL_WORLD_CELL}
			is_autoscroll_enabled := true
			add_widgets
			set_minimum_size (300, 300)
			build_add_world
		end

feature {NONE} -- Implementation

	add_widgets
			-- Check adding two colors
		local
			f: HSB_COLOR_FACTORY
		do
			create f
				-- Primary colors
			print ("----  Primary colors ----%N")
			add_test (f.red, f.red, f.red)
			add_test (f.green, f.green, f.green)
			add_test (f.blue, f.blue, f.blue)
				-- Secondary colors	(combination of primaries)
			print ("----  Secondary colors ----%N")
			add_test (f.red, f.green, f.yellow)
			add_test (f.green, f.blue, f.cyan)
			add_test (f.blue, f.red, f.magenta)
				-- Tertiary
			print ("----  Tertiary colors ----%N")
			add_test (f.red, f.yellow, f.orange)
			add_test (f.yellow, f.green, f.chartreuse)
			add_test (f.green, f.cyan, f.spring)
			add_test (f.cyan, f.blue, f.azure)
			add_test (f.blue, f.magenta, f.violet)
			add_test (f.magenta, f.red, f.rose)
				-- Quaternary
			print ("----  Quaternary colors ----%N")
			add_test (f.red, f.orange, f.vermilion)
			add_test (f.orange, f.yellow, f.amber)
			add_test (f.yellow, f.chartreuse, f.lime)
			add_test (f.chartreuse, f.green, f.harlequin)
			add_test (f.green, f.spring, f.erin)
			add_test (f.spring, f.cyan, f.aquamarine)
			add_test (f.cyan, f.azure, f.capri)
			add_test (f.azure, f.blue, f.cerulean)
			add_test (f.blue, f.violet, f.indigo)
			add_test (f.violet, f.magenta, f.purple)
			add_test (f.magenta, f.rose, f.cerise)
			add_test (f.rose, f.red, f.crimson)
				-- Quiary
			print ("----  Quiary colors ----%N")
			add_test (f.red, f.vermilion, f.scarlet)
			add_test (f.vermilion, f.orange, f.persimmon)
			add_test (f.orange, f.amber, f.orange_peel)
			add_test (f.amber, f.yellow, f.golden_yellow)
			add_test (f.yellow, f.lime, f.lemon)
			add_test (f.lime, f.chartreuse, f.spring_bud)
			add_test (f.chartreuse, f.harlequin, f.bright_green)
			add_test (f.harlequin, f.green, f.neon_green)
			add_test (f.green, f.erin, f.jade)
			add_test (f.erin, f.spring, f.emerald)
			add_test (f.spring, f.aquamarine, f.mint)
			add_test (f.aquamarine, f.cyan, f.turquiose)
			add_test (f.cyan, f.capri, f.sky_blue)
			add_test (f.capri, f.azure, f.cornflower)
			add_test (f.azure, f.cerulean, f.cobalt)
			add_test (f.cerulean, f.blue, f.sapphire)
			add_test (f.blue, f.indigo, f.iris)
			add_test (f.indigo, f.violet, f.veronica)
			add_test (f.violet, f.purple, f.amethyst)
			add_test (f.purple, f.magenta, f.phlox)
			add_test (f.magenta, f.cerise, f.fuchsia)
			add_test (f.cerise, f.rose, f.deep_pink)
			add_test (f.rose, f.crimson, f.raspberry)
			add_test (f.crimson, f.red, f.amaranth)
		end

	add_test (a_color, a_other, a_expected: HSB_COLOR)
			-- Test `a_color' + `a_other'.  Should get `a_expected'.
			-- Print message if not correct
		local
			c: HSB_COLOR
		do
			c := a_color + a_other
			if c ~ a_expected then
--				print (a_color.name + " + " + a_other.name + " = " + c.name + "%N")
			else
				print (a_color.name + " + " + a_other.name + " = " + c.name)
				print ("      expected  " + a_expected.name + " " + a_expected.hue.out)
				print ("   but got " + c.hue.out + "%N")
			end
		end

	build_add_world
			-- Fill the area that shows adding of colors
		local
			fac: HSB_COLOR_FACTORY
			row, prev_row: EV_MODEL_WORLD
			t: EV_MODEL_TEXT
			jump: INTEGER
		do
			create fac
			jump := 60
				-- red + green
			row := new_sum_row (fac.red, fac.green)
			world.extend (row)
			prev_row := row
				-- red + yellow
			row := new_sum_row (fac.red, fac.yellow)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + magenta
			row := new_sum_row (fac.red, fac.magenta)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- rose + orange
			row := new_sum_row (fac.rose, fac.orange)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- magenta + yellow
			row := new_sum_row (fac.magenta, fac.yellow)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row

				-- yellow & green
			row := new_sum_row (fac.yellow, fac.green)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row


				-- red + blue
			row := new_sum_row (fac.red, fac.blue)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- blue + red
			row := new_sum_row (fac.blue, fac.red)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + yellow
			row := new_sum_row (fac.red, fac.yellow)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + cyan
			row := new_sum_row (fac.red, fac.cyan)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + magenta
			row := new_sum_row (fac.red, fac.magenta)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- magenta + red
			row := new_sum_row (fac.magenta, fac.red)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + orange
			row := new_sum_row (fac.red, fac.orange)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + chartreuse
			row := new_sum_row (fac.red, fac.chartreuse)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + spring_green
			row := new_sum_row (fac.red, fac.spring)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + azure
			row := new_sum_row (fac.red, fac.azure)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- azure _ red
			row := new_sum_row (fac.azure, fac.red)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + violet
			row := new_sum_row (fac.red, fac.violet)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + violet
			row := new_sum_row (fac.red, fac.violet)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- violet + red
			row := new_sum_row (fac.violet, fac.red)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- red + rose
			row := new_sum_row (fac.red, fac.rose)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- rose + red
			row := new_sum_row (fac.rose, fac.red)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row


				-- green + blue
			row := new_sum_row (fac.green, fac.blue)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- Red + yellow
			row := new_sum_row (fac.red, fac.yellow)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
				-- yellow + red
			row := new_sum_row (fac.orange, fac.green)
			row.set_x_y (prev_row.x, prev_row.y + jump)
			world.extend (row)
			prev_row := row
		end

	new_sum_row (a_color, a_other_color: HSB_COLOR): EV_MODEL_WORLD
			-- A row that show the effect of adding `a_other_color'
			-- to `a_color'
		local
			w, h, gap: INTEGER
			b1, b2, b3: EV_MODEL_WORLD
		do
			create Result
			w := 200
			h := 50
			gap := 50
				-- Create box for first color
			b1 := color_box (a_color, w, h)
			Result.extend (b1)
				-- Create box for second color
			b2 := color_box (a_other_color, w, h)
			b2.set_x_y (b1.x + w + gap, b1.y)
			Result.extend (b2)
				-- Create box for third color
			b3 := color_box (a_color + a_other_color, w, h)
			b3.set_x_y (b2.x + w + gap, b2.y)
			Result.extend (b3)
		end

	color_box (a_color: HSB_COLOR; a_width, a_height: INTEGER): EV_MODEL_WORLD
			-- Create a box with `a_color' background and text
			-- describing the color
		local
			s: STRING
			rec: EV_MODEL_RECTANGLE
			t: EV_MODEL_TEXT
			c: EV_COLOR
			fac: HSB_COLOR_FACTORY
		do
			create Result
			create fac
			c := a_color.as_ev_color
			create rec.make_rectangle (100, 100, a_width, a_height)
			rec.set_background_color (c)
--			rec.set_foreground_color (c)
			s := "        " + fac.name (a_color) + "%N"
			s := s + "HSB:  "
			s := s + "(" + a_color.hue.out + ", " + a_color.saturation.out + ", " + a_color.brightness.out + ")%N"
			s := s + "RGB:  "
			s := s + "(" + c.red.out + ", " + c.green.out + ", " + c.blue.out + ")"
			create t.make_with_text (s)
			t.set_x_y (rec.x, rec.y)
			Result.extend (rec)
			Result.extend (t)
		end

end
