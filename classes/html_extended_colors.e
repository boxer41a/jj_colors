note
	description: "[
		A factory for HTML "basic" and "extended colors" as described 
		in https://en.wikipedia.org/wiki/Web_colors.
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/23"
	copyright: "Copyright (c) 2023, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	HTML_EXTENDED_COLORS

inherit

		HSB_COLOR_FACTORY

create
	default_create

feature -- Access (pink colors)

	medium_violet_red: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.make (228, 206, 110)
		end

	deep_pink: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.make (232, 255, 138)
		end

	pale_violet_red: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.make (241, 152, 166)
		end

	hot_pink: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.make (234, 255, 180)
		end

	light_pink: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.make (249, 255, 219)
		end

	pink: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.make (248, 255, 224)
		end

feature -- Access (red colors)

	dark_red: HSB_COLOR
			-- HTML color DarkRed
		once
			create Result.make (0, 255, 70)
		end

	red: HSB_COLOR
			-- HTML color Red
		once
			create Result.make (0, 255, 128)
		end

	Firebrick: HSB_COLOR
			-- HTML color Firebrick
		once
			create Result.make (0, 173, 106)
		end

	crimson: HSB_COLOR
			-- HTML color Crimson
		once
			create Result.make (247, 213, 120)
		end

	indian_red: HSB_COLOR
			-- HTML color IndianRed
		once
			create Result.make (0, 135, 149)
		end

	light_coral: HSB_COLOR
			-- HTML color LightCoral
		once
			create Result.make (0, 201, 184)
		end

	salmon: HSB_COLOR
			-- HTML color Salmon
		once
			create Result.make (4, 238, 183)
		end

	dark_salmon: HSB_COLOR
			-- HTML color DarkSalmon
		once
			create Result.make (11, 183, 178)
		end

	light_salmon: HSB_COLOR
			-- HTML color LightSalmon
		once
			create Result.make (12, 255, 189)
		end

feature -- Access (orange colors)

	orange_red: HSB_COLOR
			-- HTML color OrangeRed
		once
			create Result.make (11, 255, 128)
		end

	tomato: HSB_COLOR
			-- HTML color Tomato
		once
			create Result.make (6, 255, 163)
		end

	dark_orange: HSB_COLOR
			-- HTML color DarkOrange
		once
			create Result.make (23, 255, 128)
		end

	coral: HSB_COLOR
			-- HTML color Coral
		once
			create Result.make (11, 255, 168)
		end

	orange: HSB_COLOR
			-- HTML color Orange
		once
			create Result.make (28, 255, 128)
		end

feature -- Access (yellow colors)

	dark_khaki: HSB_COLOR
			-- HTML color DarkKhaki
		once
			create Result.make (40, 98, 148)
		end

	gold: HSB_COLOR
			-- HTML color Gold
		once
			create Result.make (36, 255, 128)
		end

	khaki: HSB_COLOR
			-- HTML color Khiki
		once
			create Result.make (38, 196, 190)
		end

	peach_puff: HSB_COLOR
			-- HTML color PeachPuff
		once
			create Result.make (20, 255, 220)
		end

	yellow: HSB_COLOR
			-- HTML color Yellow
		once
			create Result.make (43, 255, 128)
		end

	pale_goldenrod: HSB_COLOR
			-- HTML color PaleGoldenrod
		once
			create Result.make (39, 170, 204)
		end

	moccasin: HSB_COLOR
			-- HTML color Moccasin
		once
			create Result.make (27, 255, 218)
		end

	papaya_whip: HSB_COLOR
			-- HTML color PapayaWhip
		once
			create Result.make (26, 255, 234)
		end

	light_goldenrod_yellow: HSB_COLOR
			-- HTML color LightGodenrodYellow
		once
			create Result.make (43, 204, 230)
		end

	lemon_chiffon: HSB_COLOR
			-- HTML color LemonChiffon
		once
			create Result.make (38, 255, 230)
		end

	light_yellow: HSB_COLOR
			-- HTML color LightYellow
		once
			create Result.make (43, 255, 240)
		end

feature -- Access (brown colors)

	maroon: HSB_COLOR
			-- HTML color Maroon
		once
			create Result.make (0, 255, 64)
		end

	brown: HSB_COLOR
			-- HTML color Brown
		once
			create Result.make (0, 152, 104)
		end

	saddle_brown: HSB_COLOR
			-- HTML color SaddleBrown
		once
			create Result.make (18, 194, 79)
		end

	sienna: HSB_COLOR
			-- HTML color Sienna
		once
			create Result.make (13, 143, 103)
		end

	chocolate: HSB_COLOR
			-- HTML color Chocolate
		once
			create Result.make (18, 191, 120)
		end

	deep_goldenrod: HSB_COLOR
			-- HTML color DeepGoldenrod
		once
			create Result.make (30, 226, 98)
		end

	peru: HSB_COLOR
			-- HTML color Peru
		once
			create Result.make (21, 150, 134)
		end

	rosy_brown: HSB_COLOR
			-- HTML color RoseyBrown
		once
			create Result.make (0, 64, 166)
		end

	goldenrod: HSB_COLOR
			-- HTML color Goldenrod
		once
			create Result.make (30, 190, 125)
		end

	sandy_brown: HSB_COLOR
			-- HTML color SandyBrown
		once
			create Result.make (20, 222, 170)
		end

	tan: HSB_COLOR
			-- HTML color Tan
		once
			create Result.make (24, 112, 175)
		end

	burlywood: HSB_COLOR
			-- HTML color Burlywood
		once
			create Result.make (24, 145, 179)
		end

	wheat: HSB_COLOR
			-- HTML color Wheat
		once
			create Result.make (29, 200, 209)
		end

	navajo_white: HSB_COLOR
			-- HTML color NavajoWhite
		once
			create Result.make (26, 255, 214)
		end

	bisque: HSB_COLOR
			-- HTML color Bisque
		once
			create Result.make (23, 255, 226)
		end

	blanched_almond: HSB_COLOR
			-- HTML color BlanchedAlmond
		once
			create Result.make (26, 255, 230)
		end

	cornsilk: HSB_COLOR
			-- HTML color Cornsilk
		once
			create Result.make (34, 255, 238)
		end

feature -- Access (purple, violet, and magenta colors)

	indigo: HSB_COLOR
			-- HTML color Indigo
		once
			create Result.make (195, 255, 65)
		end

	purple: HSB_COLOR
			-- HTML color Purple
		once
			create Result.make (213, 255, 64)
		end

	dark_magenta: HSB_COLOR
			-- HTML color DarkMagenta
		once
			create Result.make (213, 255, 70)
		end

	dark_violet: HSB_COLOR
			-- HTML color DarkViolet
		once
			create Result.make (200, 255, 106)
		end

	dark_slate_blue: HSB_COLOR
			-- HTML color DarkSlateBlue
		once
			create Result.make (176, 99, 100)
		end

	blue_violet: HSB_COLOR
			-- HTML color BlueViolet
		once
			create Result.make (192, 194, 135)
		end

	dark_orchid: HSB_COLOR
			-- HTML color DarkOrchid
		once
			create Result.make (198, 155, 127)
		end

	fuchsia: HSB_COLOR
			-- HTML color Fuchsia
		once
			create Result.make (213, 255, 128)
		end

	magenta: HSB_COLOR
			-- HTML color Magenta
		once
			create Result.make (213, 255, 128)
		end

	slate_blue: HSB_COLOR
			-- HTML color SlateBlue
		once
			create Result.make (176, 136, 148)
		end

	medium_slate_blue: HSB_COLOR
			-- HTML color MediumSlateBlue
		once
			create Result.make (176, 203, 171)
		end

	medium_orchid: HSB_COLOR
			-- HTML color MediumOrchid
		once
			create Result.make (204, 150, 148)
		end

	medium_purple: HSB_COLOR
			-- HTML color MediumPurple
		once
			create Result.make (184, 152, 166)
		end

	orchid: HSB_COLOR
			-- HTML color Orchid
		once
			create Result.make (214, 150, 165)
		end

	violet: HSB_COLOR
			-- HTML color Violet
		once
			create Result.make (213, 194, 184)
		end

	plum: HSB_COLOR
			-- HTML color Plum
		once
			create Result.make (213, 121, 191)
		end

	thistle: HSB_COLOR
			-- HTML color Thistle
		once
			create Result.make (213, 62, 204)
		end

	lavender: HSB_COLOR
			-- HTML color Lavender
		once
			create Result.make (170, 170, 240)
		end

feature -- Access (blue colors)

	midnight_blue: HSB_COLOR
			-- HTML color MidnightBlue
		once
			create Result.make (170, 162, 69)
		end

	navy: HSB_COLOR
			-- HTML color Navy
		once
			create Result.make (170, 255, 64)
		end

	dark_blue: HSB_COLOR
			-- HTML color DarkBlue
		once
			create Result.make (170, 255, 70)
		end

	medium_blue: HSB_COLOR
			-- HTML color MediumBlue
		once
			create Result.make (170, 255, 103)
		end

	blue: HSB_COLOR
			-- HTML color Blue
		once
			create Result.make (170, 255, 128)
		end

	royal_blue: HSB_COLOR
			-- HTML color RoyalBlue
		once
			create Result.make (159, 185, 145)
		end

	steel_blue: HSB_COLOR
			-- HTML color SteelBlue
		once
			create Result.make (147, 112, 125)
		end

	dodger_blue: HSB_COLOR
			-- HTML color DodgerBlue
		once
			create Result.make (149, 255, 143)
		end

	deep_sky_blue: HSB_COLOR
			-- HTML color DeepSkyBlue
		once
			create Result.make (138, 255, 128)
		end

	cornflower_blue: HSB_COLOR
			-- HTML color CornflowerBlue
		once
			create Result.make (155, 202, 169)
		end

	sky_blue: HSB_COLOR
			-- HTML color SkyBlue
		once
			create Result.make (140, 182, 185)
		end

	light_sky_blue: HSB_COLOR
			-- HTML color LightSkyBlue
		once
			create Result.make (144, 235, 193)
		end

	light_steel_blue: HSB_COLOR
			-- HTML color LightSteelBlue
		once
			create Result.make (152, 105, 199)
		end

	light_blue: HSB_COLOR
			-- HTML color LightBlue
		once
			create Result.make (138, 136, 202)
		end

	powder_blue: HSB_COLOR
			-- HTML color PowderBlue
		once
			create Result.make (132, 132, 203)
		end

feature -- Access (cyan colors)

	teal: HSB_COLOR
			-- HTML color Teal
		once
			create Result.make (128,255, 64)
		end

	dark_cyan: HSB_COLOR
			-- HTML color DarkCyan
		once
			create Result.make (128, 255, 70)
		end

	light_sea_green: HSB_COLOR
			-- HTML color LightSeaGreen
		once
			create Result.make (125, 177, 105)
		end

	cadet_blue: HSB_COLOR
			-- HTML color CadetBlue
		once
			create Result.make (129, 65, 128)
		end

	dark_turquoise: HSB_COLOR
			-- HTML color DarkTurquoise
		once
			create Result.make (128, 255, 105)
		end

	medium_turquoise: HSB_COLOR
			-- HTML color MediumTurquoise
		once
			create Result.make (126, 153, 141)
		end

	Turquoise: HSB_COLOR
			-- HTML color Turquiose
		once
			create Result.make (123, 184, 144)
		end

	aqua: HSB_COLOR
			-- HTML color Aqua
		once
			create Result.make (128, 255, 128)
		end

	cyan: HSB_COLOR
			-- HTML color Cyan
		once
			create Result.make (128, 255, 128)
		end

	aquamarine: HSB_COLOR
			-- HTML color Aquamarine
		once
			create Result.make (128, 255, 191)
		end

	pale_turquoise: HSB_COLOR
			-- HTML color PaleTrquoise
		once
			create Result.make (128, 166, 207)
		end

	light_cyan: HSB_COLOR
			-- HTML color LightCyan
		once
			create Result.make (128, 255, 240)
		end

feature -- Access (green colors)

	dark_green: HSB_COLOR
			-- HTML color DarkGreen
		once
			create Result.make (85, 255, 50)
		end

	green: HSB_COLOR
			-- HTML color Green
		once
			create Result.make (85, 255, 64)
		end

	dark_olive_green: HSB_COLOR
			-- HTML color DarkOliveGreen
		once
			create Result.make (58, 99, 77)
		end

	forest_green: HSB_COLOR
			-- HTML color ForestGreen
		once
			create Result.make (85, 155, 87)
		end

	sea_green: HSB_COLOR
			-- HTML color SeaGreen
		once
			create Result.make (103, 128, 93)
		end

	olive: HSB_COLOR
			-- HTML color Olive
		once
			create Result.make (43, 255, 64)
		end

	olive_drab: HSB_COLOR
			-- HTML color OliveDrab
		once
			create Result.make (57, 154, 89)
		end

	medium_sea_green: HSB_COLOR
			-- HTML color MediumSeaGreen
		once
			create Result.make (104, 127, 120)
		end

	lime_green: HSB_COLOR
			-- HTML color LimeGreen
		once
			create Result.make (85, 155, 128)
		end

	lime: HSB_COLOR
			-- HTML color Lime
		once
			create Result.make (85, 255, 128)
		end

	spring_green: HSB_COLOR
			-- HTML color SpringGreen
		once
			create Result.make (106, 255, 128)
		end

	medium_spring_green: HSB_COLOR
			-- HTML color MediumSpringGreen
		once
			create Result.make (111, 255, 125)
		end

	dark_sea_green: HSB_COLOR
			-- HTML color DarkSeaGreen
		once
			create Result.make (85, 64, 166)
		end

	medium_aqua_marine: HSB_COLOR
			-- HTML color MediumAquaMarine
		once
			create Result.make (113, 129, 154)
		end

	yellow_green: HSB_COLOR
			-- HTML color YellowGreen
		once
			create Result.make (57, 155, 128)
		end

	lawn_green: HSB_COLOR
			-- HTML color LawnGreen
		once
			create Result.make (64, 255, 126)
		end

	chartreuse: HSB_COLOR
			-- HTML color Chartreuse
		once
			create Result.make (64, 255, 128)
		end

	light_green: HSB_COLOR
			-- HTML color LightGreen
		once
			create Result.make (85, 187, 191)
		end

	green_yellow: HSB_COLOR
			-- HTML color GreenYellow
		once
			create Result.make (60, 255, 151)
		end

	pale_green: HSB_COLOR
			-- HTML color PaleGreen
		once
			create Result.make (85, 236, 202)
		end

feature -- Access (white colors)

	misty_rose: HSB_COLOR
			-- HTML color MistyRose
		once
			create Result.make (4, 255, 240)
		end

	antique_white: HSB_COLOR
			-- HTML color AntiqueWhite
		once
			create Result.make (24, 198, 233)
		end

	Linen: HSB_COLOR
			-- HTML color Linen
		once
			create Result.make (21, 170, 240)
		end

	beige: HSB_COLOR
			-- HTML color Beige
		once
			create Result.make (43, 142, 233)
		end

	white_smoke: HSB_COLOR
			-- HTML color WhiteSmoke
		once
			create Result.make (0, 0, 245)
		end

	lavender_blush: HSB_COLOR
			-- HTML color LavenderBlush
		once
			create Result.make (241, 255, 248)
		end

	old_lace: HSB_COLOR
			-- HTML color OldLace
		once
			create Result.make (28, 217, 242)
		end

	alice_blue: HSB_COLOR
			-- HTML color AliceBlue
		once
			create Result.make (147, 255, 248)
		end

	seashell: HSB_COLOR
			-- HTML color Seashell
		once
			create Result.make (18, 255, 247)
		end

	ghost_white: HSB_COLOR
			-- HTML color GhostWhite
		once
			create Result.make (170, 255, 252)
		end

	honey_dew: HSB_COLOR
			-- HTML color HoneyDew
		once
			create Result.make (85, 255, 248)
		end

	floral_white: HSB_COLOR
			-- HTML color FloralWhite
		once
			create Result.make (28, 255, 248)
		end

	azure: HSB_COLOR
			-- HTML color Azure
		once
			create Result.make (128, 255, 248)
		end

	mint_green: HSB_COLOR
			-- HTML color MingGreen
		once
			create Result.make (106, 255, 250)
		end

	snow: HSB_COLOR
			-- HTML color Snow
		once
			create Result.make (0, 255, 253)
		end

	ivory: HSB_COLOR
			-- HTML color Ivory
		once
			create Result.make (43, 255, 248)
		end

	white: HSB_COLOR
			-- HTML color White
		once
			create Result.make (0, 0, 255)
		end

feature -- Access (gray and black colors

	black: HSB_COLOR
			-- HTML color Black
		once
			create Result.make (0, 0, 0)
		end

	dark_slate_gray: HSB_COLOR
			-- HTML color DarkSlateGray
		once
			create Result.make (128, 65, 63)
		end

	dim_gray: HSB_COLOR
			-- HTML color DimGray
		once
			create Result.make (0, 0, 105)
		end

	slate_gray: HSB_COLOR
			-- HTML color SlateGray
		once
			create Result.make (149, 32, 128)
		end

	gray: HSB_COLOR
			-- HTML color Gray
		once
			create Result.make (0, 0, 128)
		end

	light_slate_gray: HSB_COLOR
			-- HTML color LightSlateGray
		once
			create Result.make (149, 36, 136)
		end

	dark_gray: HSB_COLOR
			-- HTML color DarkGray
		once
			create Result.make (0, 0, 169)
		end

	silver: HSB_COLOR
			-- HTML color Silver
		once
			create Result.make (0, 0, 192)
		end

	light_gray: HSB_COLOR
			-- HTML color LightGray
		once
			create Result.make (0, 0, 211)
		end

	gainsboro: HSB_COLOR
			-- HTML color Gainsboro
		once
			create Result.make (0, 0, 220)
		end

feature {NONE} -- Implementation

	table_imp: HSB_COLOR_TABLE
			-- Add the above colors to the table, indexed by the color's name.
		once
			create Result
				-- Pink colors
			Result.extend (medium_violet_red, "medium violet red")
			Result.extend (deep_pink, "deep pink")
			Result.extend (pale_violet_red, "pale violet red")
			Result.extend (hot_pink, "hot pink")
			Result.extend (light_pink, "light pink")
			Result.extend (pink, "pink")
				-- Red colors
			Result.extend (dark_red, "dark red")
			Result.extend (red, "red")
			Result.extend (firebrick, "firebrick")
			Result.extend (crimson, "crimson")
			Result.extend (indian_red, "indian red")
			Result.extend (light_coral, "light coral")
			Result.extend (salmon, "salmon")
			Result.extend (dark_salmon, "dark salmon")
			Result.extend (light_salmon, "light salmon")
				-- Orange colors
			Result.extend (orange_red, "orange red")
			Result.extend (tomato, "tomato")
			Result.extend (dark_orange, "dark orange")
			Result.extend (coral, "coral")
			Result.extend (orange, "orange")
				-- Yellow colors
			Result.extend (dark_khaki, "dark khaki")
			Result.extend (gold, "gold")
			Result.extend (khaki, "khaki")
			Result.extend (peach_puff, "peach puff")
			Result.extend (yellow, "yellow")
			Result.extend (pale_goldenrod, "pale goldenrod")
			Result.extend (moccasin, "moccasin")
			Result.extend (papaya_whip, "papaya whip")
			Result.extend (light_goldenrod_yellow, "light goldenrod yellow")
			Result.extend (lemon_chiffon, "lemon chiffon")
			Result.extend (light_yellow, "light yellow")
				-- Brown colors
			Result.extend (maroon, "maroon")
			Result.extend (brown, "brown")
			Result.extend (saddle_brown, "saddle brown")
			Result.extend (sienna, "sienna")
			Result.extend (chocolate, "chocolate")
			Result.extend (deep_goldenrod, "deep goldenrod")
			Result.extend (peru, "peru")
			Result.extend (rosy_brown, "rosy brown")
			Result.extend (goldenrod, "goldenrod")
			Result.extend (sandy_brown, "sandy brown")
			Result.extend (tan, "tan")
			Result.extend (burlywood, "burlywood")
			Result.extend (wheat, "wheat")
			Result.extend (navajo_white, "navajo white")
			Result.extend (bisque, "bisque")
			Result.extend (blanched_almond, "blanched almond")
			Result.extend (cornsilk, "cornsilk")
				-- Purple, violet, and magenta colors
			Result.extend (indigo, "indigo")
			Result.extend (purple, "purple")
			Result.extend (dark_magenta, "dark magenta")
			Result.extend (dark_violet, "dark violet")
			Result.extend (dark_slate_blue, "dark slate blue")
			Result.extend (blue_violet, "blue violet")
			Result.extend (dark_orchid, "dark orchid")
			Result.extend (fuchsia, "fuchsia")
			Result.extend (magenta, "magenta")
			Result.extend (slate_blue, "slate blue")
			Result.extend (medium_slate_blue, "medium slate blue")
			Result.extend (medium_orchid, "medium orchid")
			Result.extend (medium_purple, "medium purple")
			Result.extend (orchid, "orchid")
			Result.extend (violet, "violet")
			Result.extend (plum, "plum")
			Result.extend (thistle, "thistle")
			Result.extend (lavender, "lavender")
				-- Bule colors
			Result.extend (midnight_blue, "midnight blue")
			Result.extend (navy, "navy")
			Result.extend (dark_blue, "dark blue")
			Result.extend (medium_blue, "medium blue")
			Result.extend (blue, "blue")
			Result.extend (royal_blue, "royal blue")
			Result.extend (steel_blue, "steel blue")
			Result.extend (dodger_blue, "dodger blue")
			Result.extend (deep_sky_blue, "deep sky blue")
			Result.extend (cornflower_blue, "cornflower blue")
			Result.extend (sky_blue, "sky blue")
			Result.extend (light_sky_blue, "light sky blue")
			Result.extend (light_steel_blue, "light steel blue")
			Result.extend (light_blue, "light blue")
			Result.extend (powder_blue, "powder blue")
				-- Cyan colors
			Result.extend (teal, "teal")
			Result.extend (dark_cyan, "dark cyan")
			Result.extend (light_sea_green, "light sea green")
			Result.extend (cadet_blue, "cadet blue")
			Result.extend (dark_turquoise, "dark turquoise")
			Result.extend (medium_turquoise, "medium turquoise")
			Result.extend (turquoise, "turquoise")
			Result.extend (aqua, "aqua")
			Result.extend (cyan, "cyan")
			Result.extend (aquamarine, "aquamarine")
			Result.extend (pale_turquoise, "pale turquoise")
			Result.extend (light_cyan, "light cyan")
				-- Green colors
			Result.extend (dark_green, "dark green")
			Result.extend (green, "green")
			Result.extend (dark_olive_green, "dark olive green")
			Result.extend (forest_green, "forest green")
			Result.extend (sea_green, "sea green")
			Result.extend (olive, "olive")
			Result.extend (olive_drab, "olive drab")
			Result.extend (medium_sea_green, "medium sea green")
			Result.extend (lime_green, "lime_green")
			Result.extend (lime, "lime")
			Result.extend (spring_green, "spring green")
			Result.extend (medium_spring_green, "medium spring green")
			Result.extend (dark_sea_green, "dark sea green")
			Result.extend (medium_aqua_marine, "medium aqua marine")
			Result.extend (yellow_green, "yellow green")
			Result.extend (lawn_green, "lawn green")
			Result.extend (chartreuse, "chartreuse")
			Result.extend (light_green, "light green")
			Result.extend (green_yellow, "green yellow")
			Result.extend (pale_green, "pale green")
				-- White colors
			Result.extend (misty_rose, "misty rose")
			Result.extend (antique_white, "antique white")
			Result.extend (linen, "linen")
			Result.extend (beige, "beige")
			Result.extend (white_smoke, "white smoke")
			Result.extend (lavender_blush, "lavender blush")
			Result.extend (old_lace, "old lace")
			Result.extend (alice_blue, "alice blue")
			Result.extend (seashell, "seashell")
			Result.extend (ghost_white, "ghost white")
			Result.extend (honey_dew, "honey dew")
			Result.extend (floral_white, "floral white")
			Result.extend (azure, "azure")
			Result.extend (mint_green, "mint green")
			Result.extend (snow, "snow")
			Result.extend (ivory, "ivory")
			Result.extend (white, "white")
				-- Gray and black colors
			Result.extend (black, "black")
			Result.extend (dark_slate_gray, "dark slate gray")
			Result.extend (dim_gray, "dim gray")
			Result.extend (slate_gray, "slate gray")
			Result.extend (gray, "gray")
			Result.extend (light_slate_gray, "light slate gray")
			Result.extend (dark_gray, "dark gray")
			Result.extend (silver, "silver")
			Result.extend (light_gray, "light gray")
			Result.extend (gainsboro, "gainsboro")
		end

end
