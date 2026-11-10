note
	description: "[
		A view that demonstrates the spectrum of colors available
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

	SHARED_UTILS
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

	size: INTEGER = 50
			-- Size of the color squares and length of rectangles

	add_widgets
			-- Show the color palette to demonstrate change in HSL values
		local
			row: EV_MODEL_WORLD
			prev_row: EV_MODEL_WORLD
			gap: INTEGER
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

			create t.make_with_text ("Name   EV_COLOR   HSL_COLOR")
			world.extend (t)
			t.set_x_y (100, 50)
			str := " Top Row - Saturation goes from 0 to 255 %N %
					% Middel Row - grayscale of the colors in the top row %N %
					% Bottom Row - Lightness goes from 0 to 255"
			create t.make_with_text (str)
			t.set_x_y (450, 30)
			world.extend (t)
				-- Red
			row := new_color_row (Red, "Red", Size)
			row.set_y (t.y + t.height + 5 * gap)
			world.extend (row)
				-- Green
			prev_row := row
			row := new_color_row (Green, "Green", Size)
			row.set_x_y (prev_row.x, prev_row.y + Size + 2 * gap)
			world.extend (row)
				-- Blue
			prev_row := row
			row := new_color_row (Blue, "Blue", Size)
			row.set_x_y (prev_row.x, prev_row.y + Size + 2 * gap)
			world.extend (row)
				-- Yellow
			prev_row := row
			row := new_color_row (Yellow, "Yellow", Size)
			row.set_x_y (prev_row.x, prev_row.y + Size + 2 * gap)
			world.extend (row)
				-- Cyan
			prev_row := row
			row := new_color_row (Cyan, "Cyan", Size)
			row.set_x_y (prev_row.x, prev_row.y + Size + 2 * gap)
			world.extend (row)
				-- Magenta
			prev_row := row
			row := new_color_row (Magenta, "Magenta", Size)
			row.set_x_y (prev_row.x, prev_row.y + Size + 2 * gap)
			world.extend (row)
				-- Show changes in `hue'
			prev_row := row
			row := new_hue_row
			world.extend (row)
			row.set_point_position (prev_row.point_x  + Size, prev_row.point_y + 2 * Size)
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
			rgb_fac: RGB_COLORS
			html_fac: HTML_EXTENDED_COLORS
		do
			create Result
			create rgb_fac
			create html_fac
			w := 4
			h := 50
--			create prev_rec
			from i := 0
			until i > {HSB_COLOR}.max_value
			loop
				create c.make (i, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
				create rec.make_rectangle (i * w, 0, w, h)
				rec.set_pebble (c)
				rec.set_background_color (as_ev_color (c))
				rec.set_foreground_color (as_ev_color (c))
				s := rgb_fac.name (c)
				if s ~ "Unknown" then
					s := html_fac.name (c)
				end
					-- Put color names under the spectrum
				if i \\ 2 = 0 and then not s.has_substring ("Unknown") then
--				if not s.has_substring ("Unknown") then
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
				-- Now put the hue value over the colored rectangle in the spectrum
			from i := 1
			until i > {HSB_COLOR}.max_value
			loop
				if i \\ 10 = 0 then
					create rec.make_rectangle (i * w, 0, w, h)
					create t.make_with_text (i.out)
					t.set_x_y (rec.x - w, rec.y)
					Result.extend (t)
				end
				i := i + 1
			end
		end

	new_color_row (a_color: EV_COLOR; a_name: STRING; a_size: INTEGER): EV_MODEL_WORLD
			-- Put an {EV_COLOR} next to my {HSB_COLOR}
		local
			i: INTEGER
			t: EV_MODEL_TEXT
			rec, my_rec: EV_MODEL_RECTANGLE
			col, col2: MUTABLE_HSB_COLOR
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
				-- Make the EV_COLOR square
			create rec.make_rectangle (100, 10, a_size, a_size)
			rec.set_background_color (a_color)
			rec.set_foreground_color (a_color)
			rec.set_pebble (a_color)
			t.set_x_y (rec.x - rec.width - t.width, rec.y)
--			t.set_foreground_color (a_color)
			Result.extend (t)
			Result.extend (rec)
				-- Now make my color
			create col.make_with_rgb (a_color.red, a_color.green, a_color.blue)
			create my_rec.make_rectangle (0, 0 , a_size, a_size)
			my_rec.set_x_y (rec.x + a_size + gap, rec.y)
			my_rec.set_background_color (as_ev_color (col))
			my_rec.set_foreground_color (as_ev_color (col))
			my_rec.set_pebble (as_ev_color (col))
			Result.extend (my_rec)
				-- Make the change in saturation columns
			create col2.make_with_rgb (a_color.red, a_color.green, a_color.blue)
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
				rec.set_background_color (as_ev_color (col))
				rec.set_pebble (as_ev_color (col))
				Result.extend (rec)
				create t.make_with_text (col.saturation.out)
				t.set_x_y (rec.x, rec.y)
				Result.extend (t)
				if i > n then
					rec.set_foreground_color (Black)
				else
					rec.set_foreground_color (as_ev_color (col))
				end
					-- Show grey scale in middle, using `col' of saturation row
					-- Create the rectangle
				y := prev_rec.y
				create rec.make_rectangle (0, 0, a_size, bar_s)
				rec.set_x_y (x, y)
				rec.set_background_color (as_ev_color (col.as_grayscale))
				rec.set_pebble (as_ev_color (col.as_grayscale))
				if i > n then
					rec.set_foreground_color (Black)
				else
					rec.set_foreground_color (as_ev_color (col))
				end
				Result.extend (rec)
					-- Increment the `lightness' level
				col2.set_brightness ((lit_inc * i).min ({HSB_COLOR}.max_value))
					-- Create the rectangle row aligned with bottom of color box
				y := prev_rec.y + bar_s + bar_s // 2
				create rec.make_rectangle (0, 0, a_size, bar_s)
				rec.set_x_y (x, y)
				rec.set_background_color (as_ev_color (col2))
				rec.set_pebble (as_ev_color (col2))
				if i > n then
					rec.set_foreground_color (Black)
				else
					rec.set_foreground_color (as_ev_color (col2))
				end
				Result.extend (rec)
				i := i + 1
			end
		end

end
