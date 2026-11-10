note
	description: "[
		Can be used as a factory for some {HSB_COLOR} objects.
		These once features return and {HSB_COLOR} which is not mutable.

		The names of the colors were taken from a Wipipedia article
		at:  https://en.wikipedia.org/wiki/Tertiary_color
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/23"
	copyright: "Copyright (c) 2026, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	RGB_COLORS

inherit

	HSB_COLOR_FACTORY

create
	default_create


feature -- Access (primary hues)

	red: HSB_COLOR
			-- Fully saturated color, 0 degrees = 0 base 256
		once
			create Result.make (0, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	green: HSB_COLOR
			-- Fully saturated color, 120 degrees = 85 base 256
		once
			create Result.make (85, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	blue: HSB_COLOR
			-- Fully saturated color, 240 degrees = 170 base 256
		once
			create Result.make (170, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

feature -- Access (secondary hues)

	yellow: HSB_COLOR
			-- Fully saturated color, 60 degrees = 42.5 base 256
		once
			create Result.make (42, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	cyan: HSB_COLOR
			-- Fully saturated color, 180 degrees = 127.5 base 256
		once
			create Result.make (127, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	magenta: HSB_COLOR
			-- Fully saturated color, 300 degrees = 212.5 base 256
		once
			create Result.make (213, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

feature -- Access (tertiary hues)

	orange: HSB_COLOR
			-- Fully saturated color, 30 degrees = 21.25 base 256
		once
			create Result.make (21, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	chartreuse: HSB_COLOR
			-- Fully saturated color, 90 degrees = 63.75 base 256
		once
			create Result.make (63, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	spring: HSB_COLOR
			-- Fully saturated color, 150 degrees = 106.25 base 256
		once
			create Result.make (106, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	azure: HSB_COLOR
			-- Fully saturated color, 210 degrees = 148.75 base 256
		once
			create Result.make (149, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	violet: HSB_COLOR
			-- Fully saturated color, 270 degrees = 191.25 base 256
		once
			create Result.make (191, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	rose: HSB_COLOR
			-- Fully saturated color, 330 degrees = 233.75 base 256
		once
			create Result.make (234, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

feature --Access (quaternary hues)

	vermilion: HSB_COLOR
			-- Fully saturated color, 15 degrees = 10.625 base 256
		once
			create Result.make (10, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	amber: HSB_COLOR
			-- Fully saturated color, 45 degrees = 31.875 base 256
		once
			create Result.make (31, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	lime: HSB_COLOR
			-- Fully saturated color, 75 degrees = 53.125 base 256
		once
			create Result.make (53, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	harlequin: HSB_COLOR
			-- Fully saturated color, 105 degrees = 74.375 base 256
		once
			create Result.make (74, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	erin: HSB_COLOR
			-- Fully saturated color, 135 degrees = 95.625 base 256
		once
			create Result.make (95, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	aquamarine: HSB_COLOR
			-- Fully saturated color, 165 degrees = 116.675 base 256
		once
			create Result.make (117, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	capri: HSB_COLOR
			-- Fully saturated color, 195 degrees = 138.125 base 256
		once
			create Result.make (138, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	cerulean: HSB_COLOR
			-- Fully saturated color, 225 degrees = 159.375 base 256
		once
			create Result.make (159, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	indigo: HSB_COLOR
			-- Fully saturated color, 255 degrees = 180.625 base 256
		once
			create Result.make (181, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	purple: HSB_COLOR
			-- Fully saturated color, 285 degrees = 201.875 base 256
		once
			create Result.make (202, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	cerise: HSB_COLOR
			-- Fully saturated color, 315 degrees = 223.125 base 256
		once
			create Result.make (223, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	crimson: HSB_COLOR
			-- Fully saturated color, 345 degrees = 244.375 base 256
		once
			create Result.make (244, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

feature -- Access (quinary hues)

	scarlet: HSB_COLOR
			-- Fully saturated color, 7.5 degrees = 5.312 base 256
		once
			create Result.make (5, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	persimmon: HSB_COLOR
			-- Fully saturated color, 22.5 degrees =15.9375 base 256
		once
			create Result.make (16, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	orange_peel: HSB_COLOR
			-- Fully saturated color, 37.5 degrees = 26.5625 base 256
		once
			create Result.make (27, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	golden_yellow: HSB_COLOR
			-- Fully saturated color, 52.5 degrees = 37.1875 base 256
		once
			create Result.make (37, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	lemon: HSB_COLOR
			-- Fully saturated color, 67.5 degrees = 47.8125 base 256
		once
			create Result.make (48, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	spring_bud: HSB_COLOR
			-- Fully saturated color, 82.5 degrees = 58.4375 base 256
		once
			create Result.make (58, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	bright_green: HSB_COLOR
			-- Fully saturated color, 97.5 degrees = 69.0625 base 256
		once
			create Result.make (69, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	neon_green: HSB_COLOR
			-- Fully saturated color, 112 degrees = 79.6875 base 256
		once
			create Result.make (80, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	jade: HSB_COLOR
			-- Fully saturated color, 127.5 degrees = 90.3125 base 256
		once
			create Result.make (90, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	emerald: HSB_COLOR
			-- Fully saturated color, 142.5 degrees = 180.9375 base 256
		once
			create Result.make (101, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	mint: HSB_COLOR
			-- Fully saturated color, 157.5 degrees = 111.5625 base 256
		once
			create Result.make (112, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	turquiose: HSB_COLOR
			-- Fully saturated color, 172.5 degrees = 122.1875 base 256
		once
			create Result.make (122, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	sky_blue: HSB_COLOR
			-- Fully saturated color, 187.5 degrees = 132.8125 base 256
		once
			create Result.make (133, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	cornflower: HSB_COLOR
			-- Fully saturated color, 202.5 degrees = 143.4375 base 256
		once
			create Result.make (143, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	cobalt: HSB_COLOR
			-- Fully saturated color, 217.5 degrees = 154.0625 base 256
		once
			create Result.make (154, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	sapphire: HSB_COLOR
			-- Fully saturated color, 232.5 degrees = 164.6875 base 256
		once
			create Result.make (165, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	iris: HSB_COLOR
			-- Fully saturated color, 247.5 degrees = 175.3125 base 256
		once
			create Result.make (175, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	veronica: HSB_COLOR
			-- Fully saturated color, 262.5 degrees = 185.9375 base 256
		once
			create Result.make (186, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	amethyst: HSB_COLOR
			-- Fully saturated color, 277.5 degrees = 196.5625 base 256
		once
			create Result.make (197, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	phlox: HSB_COLOR
			-- Fully saturated color, 292.5 degrees = 207.1875 base 256
		once
			create Result.make (207, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	fuchsia: HSB_COLOR
			-- Fully saturated color, 307.5 degrees = 217.8125 base 256
		once
			create Result.make (218, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	deep_pink: HSB_COLOR
			-- Fully saturated color, 322.5 degrees = 228.4375 base 256
		once
			create Result.make (228, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	raspberry: HSB_COLOR
			-- Fully saturated color, 337.5 degrees = 239.0625 base 256
		once
			create Result.make (239, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

	amaranth: HSB_COLOR
			-- Fully saturated color, 352.5 degrees = 249.6875 base 256
		once
			create Result.make (250, {HSB_COLOR}.Max_value, {HSB_COLOR}.Mid_value)
		end

feature {NONE} -- Implementation

	table_imp: HSB_COLOR_TABLE
			-- Add the above colors to the table, indexed by the color's name.
		once
			create Result
				-- primary
			Result.extend (red, "red")
			Result.extend (green, "green")
			Result.extend (blue, "blue")
				-- secondary
			Result.extend (yellow, "yellow")
			Result.extend (cyan, "cyan")
			Result.extend (magenta, "magenta")
				-- tertiary
			Result.extend (orange, "orange")
			Result.extend (chartreuse, "chartreuse")
			Result.extend (spring, "spring")
			Result.extend (azure, "azure")
			Result.extend (violet, "violet")
			Result.extend (rose, "rose")
				-- quaternary
			Result.extend (vermilion, "vermilion")
			Result.extend (amber, "amber")
			Result.extend (lime, "lime")
			Result.extend (harlequin, "harlequin")
			Result.extend (erin, "erin")
			Result.extend (aquamarine, "aquamarine")
			Result.extend (capri, "capri")
			Result.extend (cerulean, "cerulean")
			Result.extend (indigo, "indigo")
			Result.extend (purple, "purple")
			Result.extend (cerise, "ceris")
			Result.extend (crimson, "crimson")
				-- quinary
			Result.extend (scarlet, "scarlet")
			Result.extend (persimmon, "persimmon")
			Result.extend (orange_peel, "orange peel")
			Result.extend (golden_yellow, "golden_yellow")
			Result.extend (lemon, "lemon")
			Result.extend (spring_bud, "spring bud")
			Result.extend (bright_green, "bright_green")
			Result.extend (neon_green, "neon green")
			Result.extend (jade, "jade")
			Result.extend (emerald, "emarald")
			Result.extend (mint, "mint")
			Result.extend (turquiose,"turquoise")
			Result.extend (sky_blue, "sky_blue")
			Result.extend (cornflower, "cornflower")
			Result.extend (cobalt, "cobalt")
			Result.extend (sapphire, "sapphire")
			Result.extend (iris, "iris")
			Result.extend (veronica, "veronica")
			Result.extend (amethyst, "amethyst")
			Result.extend (phlox, "phlox")
			Result.extend (fuchsia, "fuchsia")
			Result.extend (deep_pink, "deep pink")
			Result.extend (raspberry, "raspberry")
			Result.extend (amaranth, "amaranth")
		end

end
