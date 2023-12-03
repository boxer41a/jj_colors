note
	description: "[
		A {VIEW} that demonstrates the spectrum of colors available
		with {HSB_COLOR} and the effects of changes in hue, saturation,
		and brightness.
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/23"
	copyright: "Copyright (c) 2023, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	HSB_SPECTRUM_VIEW

inherit

	EV_MODEL_WORLD_CELL
		redefine
			create_interface_objects,
			initialize
		end

inherit {NONE}

	EV_STOCK_COLORS
		rename
			implementation as colors_implementation
		undefine
			default_create,
			copy
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
			add_widgets
			set_minimum_size (800, 500)
		end

feature {NONE} -- Implementation

	add_widgets
			-- Show the color palette to demonstrate change in HSL values
		local
			row: EV_MODEL_WORLD
			prev_row: EV_MODEL_WORLD
			s, gap: INTEGER
			t: EV_MODEL_TEXT
			str: STRING
		do

				-- For each EV_COLOR_CONST as a hue draw a row showing
				-- effect of change in saturation with constant lightness,
				-- and effect of change in lightness while saturation constant.
				--
				-- Also, for silver, bronze, copper, etc.
				--    build_row (a_color, a_name)
				--  maybe have a table of colors with their names?
			gap := 5
			s := 60

			create t.make_with_text ("Name   EV_COLOR   HSL_COLOR")
			world.extend (t)
			t.set_x_y (150, 2)
			str := " Top Row - Saturation goes from 0 to 255 %N %
					% Middel Row - grayscale of the colors in the top row %N %
					% Bottom Row - Lightness goes from 0 to 255"
			create t.make_with_text (str)
			t.set_x_y (500, 2)
			world.extend (t)
				-- Red
			row := new_color_row (Red, "Red", s)
			row.set_y (t.y + t.height + 10 * gap)
			world.extend (row)
				-- Green
			prev_row := row
			row := new_color_row (Green, "Green", s)
			row.set_x_y (prev_row.x, prev_row.y + s + 2 * gap)
			world.extend (row)
				-- Blue
			prev_row := row
			row := new_color_row (Blue, "Blue", s)
			row.set_x_y (prev_row.x, prev_row.y + s + 2 * gap)
			world.extend (row)
				-- Yellow
			prev_row := row
			row := new_color_row (Yellow, "Yellow", s)
			row.set_x_y (prev_row.x, prev_row.y + s + 2 * gap)
			world.extend (row)
				-- Cyan
			prev_row := row
			row := new_color_row (Cyan, "Cyan", s)
			row.set_x_y (prev_row.x, prev_row.y + s + 2 * gap)
			world.extend (row)
				-- Magenta
			prev_row := row
			row := new_color_row (Magenta, "Magenta", s)
			row.set_x_y (prev_row.x, prev_row.y + s + 2 * gap)
			world.extend (row)

				-- Show changes in `hue'
			prev_row := row
			row := new_hue_row
			world.extend (row)
			row.set_x_y (prev_row.x, prev_row.y + 3 * s)
		end

	new_hue_row: EV_MODEL_WORLD
			-- Show a bar that steps through all the hues
		local
			rec: EV_MODEL_RECTANGLE
--			prev_rec: EV_MODEL_RECTANGLE
			t: EV_MODEL_TEXT
			lin: EV_MODEL_LINE
			w, h: INTEGER
			i: INTEGER
			c: HSB_COLOR
			s: STRING
			fac: HSB_COLOR_FACTORY
		do
			create Result
			create fac
			w := 6
			h := 50
--			create prev_rec
			from i := 0
			until i > {HSB_COLOR}.max_value
			loop
				create c.set (i, {HSB_COLOR}.max_value, {HSB_COLOR}.max_value // 2)
				create rec.make_rectangle (i * w, 0, w, h)
				rec.set_pebble (c.as_ev_color)
				rec.set_background_color (c.as_ev_color)
				rec.set_foreground_color (c.as_ev_color)
				s := fac.name (c)
				if i \\ 10 = 0 then
					create t.make_with_text (i.out)
					t.set_x_y (rec.x - w, rec.y)
					Result.extend (t)
				end
				if not s.has_substring ("Unknown") then
					create t.make_with_text (s)
					t.set_x_y (rec.x, rec.y + h)
					Result.extend (t)
					create lin.make_with_positions (rec.x, rec.y, rec.x, rec.y + h)
					lin.set_line_width (2)
					Result.extend (lin)
				end
				Result.extend (rec)
				i := i + 1
			end
		end

	new_color_row (a_color: EV_COLOR; a_name: STRING; a_size: INTEGER): EV_MODEL_WORLD
			-- Put an {EV_COLOR} next to my {HSB_COLOR}
		local
			i: INTEGER
			t: EV_MODEL_TEXT
			rec, my_rec: EV_MODEL_RECTANGLE
			col, col2: HSB_COLOR
			gap: INTEGER
			bar_s: INTEGER
			x, y: INTEGER
			n: INTEGER
			max, sat_inc, lit_inc: INTEGER
			prev_rec: EV_MODEL_RECTANGLE
		do
			gap := 6
			create Result
				-- Show `a_name'
			create t.make_with_text (a_name)
			create rec.make_rectangle (100, 10, a_size, a_size)
			rec.set_background_color (a_color)
			rec.set_foreground_color (a_color)
			rec.set_pebble (a_color)
			t.set_x_y (rec.point_a_x - gap - t.width, rec.y)
			Result.extend (t)
			Result.extend (rec)
				-- Now make my color
			create col.set_with_ev_color (a_color)
			create my_rec.make_rectangle (0, 0 , a_size, a_size)
			my_rec.set_x_y (rec.x + a_size + gap, rec.y)
			my_rec.set_background_color (col.as_ev_color)
			my_rec.set_foreground_color (col.as_ev_color)
			my_rec.set_pebble (col.as_ev_color)
			Result.extend (my_rec)
				-- Make the change in saturation columns
			create col2.set_with_ev_color (a_color)
			col2.set_brightness ({HSB_COLOR}.max_value)
			prev_rec := my_rec
			y := my_rec.y
			n := 10
			prev_rec := my_rec
				-- Divide the range
			max := {HSB_COLOR}.max_value
			sat_inc := max // n
			lit_inc := max // n
			col.set_saturation ({HSB_COLOR}.min_value)
			col2.set_brightness ({HSB_COLOR}.min_value)
				-- Set height of each bar
			bar_s := a_size // 4
			from i := 0
			until i > n + 1
			loop
				x := prev_rec.x + i * a_size + a_size
				y := prev_rec.y - 2 * bar_s + bar_s // 2
					-- Increment the saturation level
				col.set_saturation ((sat_inc * i).min ({HSB_COLOR}.max_value))
					-- Create the rectangle
				create rec.make_rectangle (0, 0, a_size, bar_s)
				rec.set_x_y (x, y)
				rec.set_background_color (col.as_ev_color)
				rec.set_pebble (col.as_ev_color)
				Result.extend (rec)
				create t.make_with_text (col.saturation.out)
				t.set_x_y (rec.x, rec.y)
				Result.extend (t)
				if i > n then
					rec.set_foreground_color (Black)
				else
					rec.set_foreground_color (col.as_ev_color)
				end
					-- Show grey scale in middle, using `col' of saturation row
					-- Create the rectangle
				y := prev_rec.y
				create rec.make_rectangle (0, 0, a_size, bar_s)
				rec.set_x_y (x, y)
				rec.set_background_color (col.as_grayscale.as_ev_color)
				rec.set_pebble (col.as_grayscale.as_ev_color)
				if i > n then
					rec.set_foreground_color (Black)
				else
					rec.set_foreground_color (col.as_ev_color)
				end
				Result.extend (rec)
					-- Increment the `lightness' level
				col2.set_brightness ((lit_inc * i).min ({HSB_COLOR}.max_value))
					-- Create the rectangle row aligned with bottom of color box
				y := prev_rec.y + bar_s + bar_s // 2
				create rec.make_rectangle (0, 0, a_size, bar_s)
				rec.set_x_y (x, y)
				rec.set_background_color (col2.as_ev_color)
				rec.set_pebble (col2.as_ev_color)
				if i > n then
					rec.set_foreground_color (Black)
				else
					rec.set_foreground_color (col2.as_ev_color)
				end
				Result.extend (rec)
				i := i + 1
			end
		end

end
