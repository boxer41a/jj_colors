note
	description: "[
		Shows the "HTML Extended Colors" described at:
		    https://en.wikipedia.org/wiki/Web_colors.
		Each {HSB_COLOR} is initialized from an {EV_COLOR} that was
		created from RGB values.  The {HSB_COLOR} must then be converted
		back to an {EV_COLOR} to produce the colors in an EV_APPLICATION.
		Because of rounding some precision is lost going and coming.
		    The difference between the color is slight, but can be seen
		by looking carefully at the boxes.  The view draws the background
		of each row using the {EV_COLOR}.  It then places a smaller rectangle
		built with the backgroun given by the {HSB_COLOR} over the {EV_COLOR}
		rectangle.
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/23"
	copyright: "Copyright (c) 2023, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	HTML_COLORS_VIEW

inherit

	EV_MODEL_WORLD_CELL
		redefine
			create_interface_objects,
			initialize
		end

inherit {NONE}

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
--			is_autoscroll_enabled := true
--			add_widgets
			add_html_colors
			set_minimum_size (500, 500)
		end

feature {NONE} -- Implementation

	add_html_colors
			-- Build HSB colors from the HSB_EXTENDED_COLORS class,
			-- placing bars on the right side of the widow.
		local
			bar, prev: EV_MODEL
			h, gap: INTEGER
			i: INTEGER
			t: EV_MODEL_TEXT
			fac: HTML_EXTENDED_COLORS
			tup: TUPLE [color: HSB_COLOR; name: STRING_8]
		do
			gap := 4
			h := 40
				-- Initialize `prev'
			create t.make_with_text ("    HTML Extended Colors   ")
			world.extend (t)
			prev := t
			prev.set_x_y (gap + bar_width + 100, gap)
			world.extend (prev)
			create fac
			from fac.start
			until fac.is_after
			loop
				tup := fac.item
				if tup.name ~ "medium violet red" then
					create t.make_with_text ("Pink Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
--					t.set_point_position (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "dark red" then
					create t.make_with_text ("Red Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "orange red" then
					create t.make_with_text ("Orange Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "dark khaki" then
					create t.make_with_text ("Yellow Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "maroon" then
					create t.make_with_text ("Brown Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "indigo" then
					create t.make_with_text ("Purple, Violet, and Magenta Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "midnight blue" then
					create t.make_with_text ("Blue Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "teal" then
					create t.make_with_text ("Cyan Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "dark green" then
					create t.make_with_text ("Green Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "misty rose" then
					create t.make_with_text ("White Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "black" then
					create t.make_with_text ("Gray and Black Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				end
				bar := html_extended_color_bar (tup.color, tup.name)
				bar.set_x_y (prev.x, prev.y + h + gap)
				world.extend (bar)
				prev := bar
				fac.forth
			end
		end

	html_extended_color_bar (a_color: HSB_COLOR; a_name: STRING_8): EV_MODEL_WORLD
			-- Build a colored bar to display `a_color'
		local
--			h, w,
			gap: INTEGER
			t: EV_MODEL_TEXT
			rec: EV_MODEL_RECTANGLE
			s: STRING
		do
			create Result
--			h := 25
--			w := bar
			gap := 6
				-- Make background rectangle
			create rec.make_rectangle (0, 0, 3 * bar_width, 2 * bar_height)
			rec.set_background_color (as_ev_color (a_color))
			rec.set_foreground_color (as_ev_color (a_color))
			Result.extend (rec)
			rec.set_pebble (a_color)
				-- Make the name
			create t.make_with_text (a_name)
			t.set_point_position (rec.point_a_x + gap, rec.y)
			t.set_foreground_color (as_ev_color (a_color.complement))
			Result.extend (t)
				-- Make HSB texts and rectangle
			create t.make_with_text (a_color.out + "%N" + a_color.out_in_degrees)
			t.set_x_y (rec.x, rec.y)
			t.set_foreground_color (as_ev_color (a_color.complement))
			Result.extend (t)
		end

feature {NONE} -- Implementation

	bar_width: INTEGER = 200
			-- The width of the color bar

	bar_height: INTEGER = 25
			-- The height of the color bar

	correct_count: INTEGER_REF
			-- Count the number of values that are exactly right
		once
			create Result
		end

	total_count: INTEGER_REF
			-- Count the number of values that are exactly right
		once
			create Result
		end

end
