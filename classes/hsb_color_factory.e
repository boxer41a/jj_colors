note
	description: "[
		Can be used as a factory for some {HSB_COLOR} objects.
		These features return a new object when called, so that
		the basic colors are unchanged.

		The names of the colors were taken from a Wipipedia article
		at:  https://en.wikipedia.org/wiki/Tertiary_color
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/23"
	copyright: "Copyright (c) 2023, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	HSB_COLOR_FACTORY

inherit

	ANY
		redefine
			default_create
		end

create
	default_create

feature {NONE} -- Initialization

	default_create
			-- Set up the object
		do
--			create table_imp.make (20)
		end

feature -- Access

	mid_value: INTEGER
			-- The middle value of the interval:
			--   [{HSB_COLOR}.Min_value, {HSB_COLOR}.Max_value]
		once
			Result := {HSB_COLOR}.max_value // 2 + {HSB_COLOR}.max_value \\ 2
		end

	max_value: INTEGER
			-- The largest value that can be used to create colors
		once
			Result := {HSB_COLOR}.max_value
		end

feature -- Access (primary hues)

	red: HSB_COLOR
			-- Fully saturated color, 0 degrees = 0 base 256
		do
			create Result.set (0, max_value, mid_value)
		end

	green: HSB_COLOR
			-- Fully saturated color, 120 degrees = 85 base 256
		do
			create Result.set (85, max_value, mid_value)
		end

	blue: HSB_COLOR
			-- Fully saturated color, 240 degrees = 170 base 256
		do
			create Result.set (170, max_value, mid_value)
		end

feature -- Access (secondary hues)

	yellow: HSB_COLOR
			-- Fully saturated color, 60 degrees = 42.5 base 256
		local
			stock_col: EV_STOCK_COLORS
		do
			create Result.set (42, max_value, mid_value)
		end

	cyan: HSB_COLOR
			-- Fully saturated color, 180 degrees = 127.5 base 256
		local
			stock_col: EV_STOCK_COLORS
		do
			create Result.set (127, max_value, mid_value)
		end

	magenta: HSB_COLOR
			-- Fully saturated color, 300 degrees = 212.5 base 256
		local
			stock_col: EV_STOCK_COLORS
		do
			create Result.set (213, max_value, mid_value)
		end

feature -- Access (tertiary hues)

	orange: HSB_COLOR
			-- Fully saturated color, 30 degrees = 21.25 base 256
		do
			create Result.set (21, max_value, mid_value)
		end

	chartreuse: HSB_COLOR
			-- Fully saturated color, 90 degrees = 63.75 base 256
		local
			stock_col: EV_STOCK_COLORS
		do
			create Result.set (63, max_value, mid_value)
		end

	spring: HSB_COLOR
			-- Fully saturated color, 150 degrees = 106.25 base 256
		do
			create Result.set (106, max_value, mid_value)
		end

	azure: HSB_COLOR
			-- Fully saturated color, 210 degrees = 148.75 base 256
		do
			create Result.set (149, max_value, mid_value)
		end

	violet: HSB_COLOR
			-- Fully saturated color, 270 degrees = 191.25 base 256
		do
			create Result.set (191, max_value, mid_value)
		end

	rose: HSB_COLOR
			-- Fully saturated color, 330 degrees = 233.75 base 256
		do
			create Result.set (234, max_value, mid_value)
		end

feature --Access (quaternary hues)

	vermilion: HSB_COLOR
			-- Fully saturated color, 15 degrees = 10.625 base 256
		do
			create Result.set (10, max_value, mid_value)
		end

	amber: HSB_COLOR
			-- Fully saturated color, 45 degrees = 31.875 base 256
		do
			create Result.set (31, max_value, mid_value)
		end

	lime: HSB_COLOR
			-- Fully saturated color, 75 degrees = 53.125 base 256
		do
			create Result.set (53, max_value, mid_value)
		end

	harlequin: HSB_COLOR
			-- Fully saturated color, 105 degrees = 74.375 base 256
		do
			create Result.set (74, max_value, mid_value)
		end

	erin: HSB_COLOR
			-- Fully saturated color, 135 degrees = 95.625 base 256
		do
			create Result.set (95, max_value, mid_value)
		end

	aquamarine: HSB_COLOR
			-- Fully saturated color, 165 degrees = 116.675 base 256
		do
			create Result.set (117, max_value, mid_value)
		end

	capri: HSB_COLOR
			-- Fully saturated color, 195 degrees = 138.125 base 256
		do
			create Result.set (138, max_value, mid_value)
		end

	cerulean: HSB_COLOR
			-- Fully saturated color, 225 degrees = 159.375 base 256
		do
			create Result.set (159, max_value, mid_value)
		end

	indigo: HSB_COLOR
			-- Fully saturated color, 255 degrees = 180.625 base 256
		do
			create Result.set (181, max_value, mid_value)
		end

	purple: HSB_COLOR
			-- Fully saturated color, 285 degrees = 201.875 base 256
		do
			create Result.set (202, max_value, mid_value)
		end

	cerise: HSB_COLOR
			-- Fully saturated color, 315 degrees = 223.125 base 256
		do
			create Result.set (223, max_value, mid_value)
		end

	crimson: HSB_COLOR
			-- Fully saturated color, 345 degrees = 244.375 base 256
		do
			create Result.set (244, max_value, mid_value)
		end

feature -- Access (quinary hues)

	scarlet: HSB_COLOR
			-- Fully saturated color, 7.5 degrees = 5.312 base 256
		do
			create Result.set (5, max_value, mid_value)
		end

	persimmon: HSB_COLOR
			-- Fully saturated color, 22.5 degrees =15.9375 base 256
		do
			create Result.set (16, max_value, mid_value)
		end

	orange_peel: HSB_COLOR
			-- Fully saturated color, 37.5 degrees = 26.5625 base 256
		do
			create Result.set (27, max_value, mid_value)
		end

	golden_yellow: HSB_COLOR
			-- Fully saturated color, 52.5 degrees = 37.1875 base 256
		do
			create Result.set (37, max_value, mid_value)
		end

	lemon: HSB_COLOR
			-- Fully saturated color, 67.5 degrees = 47.8125 base 256
		do
			create Result.set (48, max_value, mid_value)
		end

	spring_bud: HSB_COLOR
			-- Fully saturated color, 82.5 degrees = 58.4375 base 256
		do
			create Result.set (58, max_value, mid_value)
		end

	bright_green: HSB_COLOR
			-- Fully saturated color, 97.5 degrees = 69.0625 base 256
		do
			create Result.set (69, max_value, mid_value)
		end

	neon_green: HSB_COLOR
			-- Fully saturated color, 112 degrees = 79.6875 base 256
		do
			create Result.set (80, max_value, mid_value)
		end

	jade: HSB_COLOR
			-- Fully saturated color, 127.5 degrees = 90.3125 base 256
		do
			create Result.set (90, max_value, mid_value)
		end

	emerald: HSB_COLOR
			-- Fully saturated color, 142.5 degrees = 180.9375 base 256
		do
			create Result.set (101, max_value, mid_value)
		end

	mint: HSB_COLOR
			-- Fully saturated color, 157.5 degrees = 111.5625 base 256
		do
			create Result.set (112, max_value, mid_value)
		end

	turquiose: HSB_COLOR
			-- Fully saturated color, 172.5 degrees = 122.1875 base 256
		do
			create Result.set (122, max_value, mid_value)
		end

	sky_blue: HSB_COLOR
			-- Fully saturated color, 187.5 degrees = 132.8125 base 256
		do
			create Result.set (133, max_value, mid_value)
		end

	cornflower: HSB_COLOR
			-- Fully saturated color, 202.5 degrees = 143.4375 base 256
		do
			create Result.set (143, max_value, mid_value)
		end

	cobalt: HSB_COLOR
			-- Fully saturated color, 217.5 degrees = 154.0625 base 256
		do
			create Result.set (154, max_value, mid_value)
		end

	sapphire: HSB_COLOR
			-- Fully saturated color, 232.5 degrees = 164.6875 base 256
		do
			create Result.set (165, max_value, mid_value)
		end

	iris: HSB_COLOR
			-- Fully saturated color, 247.5 degrees = 175.3125 base 256
		do
			create Result.set (175, max_value, mid_value)
		end

	veronica: HSB_COLOR
			-- Fully saturated color, 262.5 degrees = 185.9375 base 256
		do
			create Result.set (186, max_value, mid_value)
		end

	amethyst: HSB_COLOR
			-- Fully saturated color, 277.5 degrees = 196.5625 base 256
		do
			create Result.set (197, max_value, mid_value)
		end

	phlox: HSB_COLOR
			-- Fully saturated color, 292.5 degrees = 207.1875 base 256
		do
			create Result.set (207, max_value, mid_value)
		end

	fuchsia: HSB_COLOR
			-- Fully saturated color, 307.5 degrees = 217.8125 base 256
		do
			create Result.set (218, max_value, mid_value)
		end

	deep_pink: HSB_COLOR
			-- Fully saturated color, 322.5 degrees = 228.4375 base 256
		do
			create Result.set (228, max_value, mid_value)
		end

	raspberry: HSB_COLOR
			-- Fully saturated color, 337.5 degrees = 239.0625 base 256
		do
			create Result.set (239, max_value, mid_value)
		end

	amaranth: HSB_COLOR
			-- Fully saturated color, 352.5 degrees = 249.6875 base 256
		do
			create Result.set (250, max_value, mid_value)
		end


feature -- Query

	color (a_name: STRING): HSB_COLOR
			-- The color associated with `a_name'
		require
			has_name: has (a_name)
		do
			Result := table_imp.color (a_name.as_lower).twin
		end

	name (a_color: HSB_COLOR): STRING
			-- Reverse lookup for the name of a color equivalent
			-- to `a_color'
		local
			c: HSB_COLOR
			str: detachable STRING
		do
			Result := "Unknown"
			from table_imp.start
			until attached str or else table_imp.is_after
			loop
				c := table_imp.item_for_iteration
				if c ~ a_color then
					str := table_imp.key_for_iteration
				end
				table_imp.forth
			end
			if attached str as s then
				Result := s
			end
		end

	has (a_name: STRING): BOOLEAN
			-- Does Current contain a color named `a_name'?
		do
			Result := table_imp.has (a_name)
		end

feature -- Basic operations

	extend (a_color: HSB_COLOR; a_name: STRING)
			-- Add `a_color' to the table, associating it with `a_name'
		require
			not_has_key: not has (a_name)
		do
			table_imp.extend (a_color, a_name)
		end

feature {NONE} -- Implementation

	table_imp: HSB_COLOR_TABLE
			-- Holds the basic colors for lookup in features
			-- `color' and `color_name'
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
