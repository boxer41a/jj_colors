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
			set_minimum_size (500, 500)
		end

feature {NONE} -- Implementation

	add_widgets
			-- Put colored rectangles into the `world'
		local
			bar, prev: EV_MODEL
			h, gap: INTEGER
			i: INTEGER
			tup: TUPLE [name: STRING; red, green, blue: INTEGER]
			t: EV_MODEL_TEXT
		do
			print ("%N  -----------  HTML Color Tests ------------ %N")
			gap := 4
			h := 40
				-- Initialize `prev'
			prev := html_test ("    HTML Extended Colors   ", 128, 128, 128)
--			world.extend (prev)
			from i := 1
			until i > html_colors.count
			loop
				tup := html_colors.item (i)
				if tup.name ~ "MediumVioletRed" then
					create t.make_with_text ("Pink Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "DarkRed" then
					create t.make_with_text ("Red Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "OrangeRed" then
					create t.make_with_text ("Orange Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "DarkKhaki" then
					create t.make_with_text ("Yellow Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "Maroon" then
					create t.make_with_text ("Brown Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "Indigo" then
					create t.make_with_text ("Purple, Violet, and Magenta Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "MidnightBlue" then
					create t.make_with_text ("Blue Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "Teal" then
					create t.make_with_text ("Cyan Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "DarkGreen" then
					create t.make_with_text ("Green Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "MistyRose" then
					create t.make_with_text ("White Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				elseif tup.name ~ "Black" then
					create t.make_with_text ("Gray and Black Colors")
					t.set_x_y (prev.x, prev.y + h + gap)
					world.extend (t)
					prev := t
				end
				bar := html_test (tup.name, tup.red, tup.green, tup.blue)
				bar.set_x_y (prev.x, prev.y + h + gap)
				world.extend (bar)
				prev := bar
				i := i + 1
			end
			print ("Number correct values = " + correct_count.item.out)
			print ("  out of  " + total_count.item.out + "%N")
		end

	html_colors: ARRAY [TUPLE [name: STRING; red, green, blue: INTEGER]]
			-- Holds all colors values to test
		once
			Result := <<
							-- Pink colors
						["MediumVioletRed", 199, 21, 133],
						["DeepPink", 255, 20, 147],
						["PaleVioletRed", 219, 112, 147],
						["HotPink", 255, 105, 180],
						["LightPink", 255, 182, 193],
						["Pink", 255, 192, 203],
							-- Red colors
						["DarkRed", 139, 0, 0],
						["Red", 255, 0, 0],
						["Firebrick", 178, 34, 34],
						["Crimson", 220, 20, 60],
						["IndianRed", 205, 92, 92],
						["LightCoral", 240, 128, 128],
						["Salmon", 250, 128, 114],
						["DarkSalmon", 233, 150, 122],
						["LightSalmon", 255, 160, 122],
							-- Orange colors
						["OrangeRed", 255, 69, 0],
						["Tomato", 255, 99, 71],
						["DarkOrange",255, 140, 0],
						["Coral", 255, 127, 80],
						["Orange", 255, 165, 0],
							-- Yellow colors
						["DarkKhaki", 189, 183, 107],
						["Gold", 255, 215, 0],
						["Khaki", 240, 230, 140],
						["PeachPuff", 255, 218, 185],
						["Yellow", 255, 255, 0],
						["PaleGoldenrod", 238, 232, 170],
						["Moccasin", 255, 228, 181],
						["PapayaWhip", 255, 239, 213],
						["LightGoldenrodYellow", 250, 250, 210],
						["LemonChiffon", 255, 250, 205],
						["LightYellow", 255, 255, 224],
							-- Brown colors
						["Maroon", 128, 0, 0],
						["Brown", 165, 42, 42],
						["SaddleBrown", 139, 69, 19],
						["Sienna", 160, 82, 45],
						["Chocolate", 210, 105, 30],
						["DarkGoldenrod", 184, 134, 11],
						["Peru", 205, 133, 63],
						["RosyBrown", 188, 143, 143],
						["Goldenrod", 218, 165, 32],
						["SandyBrown", 244, 164, 96],
						["Tan", 210, 180, 140],
						["Burlywood", 222, 184, 135],
						["Wheat", 245, 222, 173],
						["NavajoWhite", 255, 222, 173],
						["Bisque", 255, 228, 196],
						["BlanchedAlmond", 255, 235, 205],
						["Cornsilk", 255, 248, 220],
							-- Purple, Violet, and Magenta colors
						["Indigo", 75, 0, 130],
						["Purple", 128, 0, 128],
						["DarkMagenta", 139, 0, 139],
						["DarkViolet", 148, 0, 211],
						["DarkSlateBlue", 72, 61, 139],
						["BlueViolet", 138, 43, 226],
						["DarkOrchid", 153, 50, 204],
						["Fuchsia", 255, 0, 255],
						["Magenta", 255, 0, 255],
						["SlateBlue", 106, 90, 205],
						["MediumSlateBlue", 123, 104, 238],
						["MediumOrchid", 186, 85, 211],
						["MediumPurple", 147, 112, 219],
						["Orchid", 218, 112, 214],
						["Violet", 238, 130, 238],
						["Plum", 221, 160, 221],
						["Thistle", 216, 191, 216],
						["Lavender", 230, 230, 250],
							-- Blue colors
						["MidnightBlue", 25, 25, 112],
						["Navy", 0, 0, 128],
						["DarkBlue", 0, 0, 139],
						["MediumBlue", 0, 0, 205],
						["Blue", 0, 0, 255],
						["RoyalBlue", 65, 105, 225],
						["Steelblue", 70, 130, 180],
						["DodgerBlue", 30, 144, 255],
						["DeepSkyBlue", 0, 191, 255],
						["CornflowerBlue", 100, 149, 237],
						["SkyBlue", 135, 206, 235],
						["LightSkyBlue", 135, 206, 250],
						["LightSteelBlue", 176, 196, 222],
						["LightBlue", 173, 216, 230],
						["PowderBlue", 176, 224, 230],
							-- Cyan colors
						["Teal", 0, 128, 128],
						["DarkCyan", 0, 139, 139],
						["LightSeaGreen", 32, 178, 170],
						["CadetBlue", 95, 158, 160],
						["DarkTurquoise", 0, 206, 209],
						["MediumTurquoise", 72, 209, 204],
						["Turquoise", 64, 224, 208],
						["Aqua", 0, 255, 255],
						["Cyan", 0, 255, 255],
						["Aquamarine", 127, 255, 255],
						["PaleTurquoise", 175, 238, 238],
						["LightCyan", 224, 255, 255],
							-- Green colors
						["DarkGreen", 0, 100, 0],
						["Green", 0,128, 0],
						["DarkOliveGreen", 85, 107, 47],
						["ForestGreen", 34, 139, 34],
						["SeaGreen", 46, 139, 87],
						["Olive", 128, 128, 0],
						["OliveDrab", 107, 142, 35],
						["MediumSeaGreen", 60, 179, 113],
						["LimeGreen", 50, 205, 50],
						["Lime", 0, 255, 0],
						["SpringGreen", 0, 255, 127],
						["MediumSpringGreen", 0, 250, 154],
						["DarkSeaGreen", 143, 188, 143],
						["MediumAquamarine", 102, 205, 170],
						["YellowGreen", 154, 205, 50],
						["LawnGreen", 124, 252, 0],
						["Chartreuse", 127, 255, 0],
						["LightGreen", 144, 238, 144],
						["GreenYellow", 173, 255, 47],
						["PaleGreen", 152, 251, 152],
							-- White colors
						["MistyRose", 255, 228, 225],
						["AntiqueWhite", 250, 235, 215],
						["Linen", 250, 240, 230],
						["Beige", 245, 245, 220],
						["WhiteSmoke", 245, 245, 245],
						["LavenderBlush", 255, 240, 245],
						["OldLace", 253, 245, 230],
						["AliceBlue", 240, 248, 255],
						["Seashell", 255, 245, 238],
						["GhostWhite", 248, 248, 255],
						["HoneyDew", 240, 255, 240],
						["FloralWhite", 255, 250, 240],
						["Azure", 240, 255, 255],
						["MintCream", 245, 255, 250],
						["Snow", 255, 250, 250],
						["Ivory", 255, 255, 240],
						["White", 255, 255, 255],
							-- Gray and Black colors
						["Black", 0, 0, 0],
						["DarkSlateGray", 47, 79, 79],
						["DimGray", 105, 105, 105],
						["SlateGray", 112, 128, 144],
						["Gray", 128, 128, 128],
						["LightSlateGray", 119, 136, 153],
						["DarkGray", 169, 169, 169],
						["Silver", 192, 192, 192],
						["LightGray", 211, 211, 211],
						["Gainsboro", 220, 220, 220]
					>>

		end

	html_test (a_name: STRING; ar, ag, ab: INTEGER): EV_MODEL_WORLD
			-- Create an EV_COLOR, convert it to an {HSB_COLOR}, then
			-- convert it back to {EV_COLOR}, comparing the results.
			-- Return a bar showing the colors.
		local
			ev, as_ev, tc: EV_COLOR
			c: HSB_COLOR
			comp: HSB_COLOR

			h, w, gap: INTEGER
			t: EV_MODEL_TEXT
			long_rec, rec: EV_MODEL_RECTANGLE
			s: STRING
		do
--			print (generating_type.name + ".html_test:  ")
			create ev.make_with_8_bit_rgb (ar, ag, ab)
			check
				red_ok: ev.red_8_bit = ar
				green_ok: ev.green_8_bit = ag
				blue_ok: ev.blue_8_bit = ab
			end
			create c.set_with_ev_color (ev)
			as_ev := c.as_ev_color
			if as_ev.red_8_bit = ar then
				correct_count.set_item (correct_count.item + 1)
			end
			if as_ev.green_8_bit = ag then
				correct_count.set_item (correct_count.item + 1)
			end
			if as_ev.blue_8_bit = ag then
				correct_count.set_item (correct_count.item + 1)
			end
			total_count.set_item (total_count.item + 3)
--			if as_ev.red_8_bit = ar and as_ev.green_8_bit = ag and as_ev.blue_8_bit = ab then
--				print (a_name + "%T" + c.out + "%N")
--			else
--				print (a_name + "%T " + c.out)
--				print ("%T expected:  (" + ar.out + ", " + ag.out + ", " + ab.out + ")")
--				print ("%T  result:  (" + c.out_in_rgb + "%N")
--			end

			create Result
			h := 25
			w := 200
			gap := 6
			if c.brightness > 140 or (c.hue > 15 and c.hue < 130) then
				create tc.make_with_8_bit_rgb (0, 0, 0) -- black
			else
				create tc.make_with_8_bit_rgb (255, 255, 255) -- white
			end
				-- Make background rectangle
			create long_rec.make_rectangle (0, 0, 3 * w, 2 * h)
			long_rec.set_background_color (ev)
			long_rec.set_foreground_color (ev)
			Result.extend (long_rec)
			long_rec.set_pebble (ev)
				-- Make the name and rectangle in which to put the name
--			create rec.make_rectangle (0, 0, w, h)
--			rec.set_x_y (gap, long_rec.y)
--			Result.extend (rec)
			create t.make_with_text (a_name)
			t.set_point_position (long_rec.point_a_x + gap, long_rec.y)
			t.set_foreground_color (tc)
			Result.extend (t)
				-- Make HSB texts and rectangle
			create rec.make_rectangle (0, 0, w, h + gap)
			rec.set_x_y (long_rec.x, long_rec.y)
			as_ev := c.as_ev_color
			rec.set_background_color (as_ev)
			rec.set_foreground_color (as_ev)
			Result.extend (rec)
			create t.make_with_text (c.out + "%N" + c.out_in_degrees)
			t.set_x_y (rec.x, rec.y)
			t.set_foreground_color (tc)
			Result.extend (t)
				-- Show expected RGB and actual
			s := "expected RGB:  (" + ar.out + ", " + ag.out + ", " + ab.out + ") %N %
					%obtained RGB:  (" + as_ev.red_8_bit.out + ", " + as_ev.green_8_bit.out + ", " + as_ev.blue_8_bit.out + ")"
			create t.make_with_text (s)
			t.set_x_y (long_rec.x + w, long_rec.y)
			t.set_foreground_color (tc)
			Result.extend (t)
		end

feature {NONE} -- Implementation

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
