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

feature -- Access (pink colors)

	medium_violet_red: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.set (228, 206, 110)
		end

	deep_pink: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.set (232, 255, 138)
		end

	pale_violet_red: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.set (241, 152, 166)
		end

	hot_pink: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.set (234, 255, 180)
		end

	light_pink: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.set (249, 255, 219)
		end

	pink: HSB_COLOR
			-- HTML color MediumVioletRed
		once
			create Result.set (248, 255, 224)
		end

feature -- Access (red colors)

	dark_red: HSB_COLOR
			-- HTML color DarkRed
		once
			create Result.set (0, 255, 70)
		end

	red: HSB_COLOR
			-- HTML color Red
		once
			create Result.set (0, 255, 128)
		end

	Firebrick: HSB_COLOR
			-- HTML color Firebrick
		once
			create Result.set (0, 173, 106)
		end

	crimson: HSB_COLOR
			-- HTML color Crimson
		once
			create Result.set (247, 213, 120)
		end

	indian_red: HSB_COLOR
			-- HTML color IndianRed
		once
			create Result.set (0, 135, 149)
		end

	light_coral: HSB_COLOR
			-- HTML color LightCoral
		once
			create Result.set (0, 201, 184)
		end

	salmon: HSB_COLOR
			-- HTML color Salmon
		once
			create Result.set (4, 238, 183)
		end

	dark_salmon: HSB_COLOR
			-- HTML color DarkSalmon
		once
			create Result.set (11, 183, 178)
		end

	light_salmon: HSB_COLOR
			-- HTML color LightSalmon
		once
			create Result.set (12, 255, 189)
		end

feature -- Access (orange colors)

	orange_red: HSB_COLOR
			-- HTML color OrangeRed
		once
			create Result.set (11, 255, 128)
		end

	tomato: HSB_COLOR
			-- HTML color Tomato
		once
			create Result.set (6, 255, 163)
		end

	dark_orange: HSB_COLOR
			-- HTML color DarkOrange
		once
			create Result.set (23, 255, 128)
		end

	coral: HSB_COLOR
			-- HTML color Coral
		once
			create Result.set (11, 255, 168)
		end

	orange: HSB_COLOR
			-- HTML color Orange
		once
			create Result.set (28, 255, 128)
		end

feature -- Access (yellow colors)

	dark_khaki: HSB_COLOR
			-- HTML color DarkKhaki
		once
			create Result.set (40, 98, 148)
		end

	gold: HSB_COLOR
			-- HTML color Gold
		once
			create Result.set (36, 255, 128)
		end

	khaki: HSB_COLOR
			-- HTML color Khiki
		once
			create Result.set (38, 196, 190)
		end

	peach_puff: HSB_COLOR
			-- HTML color PeachPuff
		once
			create Result.set (20, 255, 220)
		end

	yellow: HSB_COLOR
			-- HTML color Yellow
		once
			create Result.set (43, 25, 128)
		end

	pale_goldenrod: HSB_COLOR
			-- HTML color PaleGoldenrod
		once
			create Result.set (39, 170, 204)
		end

	moccasin: HSB_COLOR
			-- HTML color Moccasin
		once
			create Result.set (27, 255, 218)
		end

	papaya_whip: HSB_COLOR
			-- HTML color PapayaWhip
		once
			create Result.set (26, 255, 234)
		end

	light_godenrod_yellow: HSB_COLOR
			-- HTML color LightGodenrodYellow
		once
			create Result.set (43, 204, 230)
		end

	lemon_chiffon: HSB_COLOR
			-- HTML color LemonChiffon
		once
			create Result.set (38, 255, 230)
		end

	light_yellow: HSB_COLOR
			-- HTML color LightYellow
		once
			create Result.set (43, 255, 240)
		end

feature -- Access (brown colors)

	maroon: HSB_COLOR
			-- HTML color Maroon
		once
			create Result.set (0, 255, 64)
		end

	brown: HSB_COLOR
			-- HTML color Brown
		once
			create Result.set (0, 152, 104)
		end

	saddle_brown: HSB_COLOR
			-- HTML color SaddleBrown
		once
			create Result.set (18, 194, 79)
		end

	sienna: HSB_COLOR
			-- HTML color Sienna
		once
			create Result.set (13, 143, 103)
		end

	chocolate: HSB_COLOR
			-- HTML color Chocolate
		once
			create Result.set (18, 191, 120)
		end

	deep_goldenrod: HSB_COLOR
			-- HTML color DeepGoldenrod
		once
			create Result.set (30, 226, 98)
		end

	peru: HSB_COLOR
			-- HTML color Peru
		once
			create Result.set (21, 150, 134)
		end

	rosy_brown: HSB_COLOR
			-- HTML color RoseyBrown
		once
			create Result.set (0, 64, 166)
		end

	goldenrod: HSB_COLOR
			-- HTML color Goldenrod
		once
			create Result.set (30, 190, 125)
		end

	sandy_brown: HSB_COLOR
			-- HTML color SandyBrown
		once
			create Result.set (20, 222, 170)
		end

	tan: HSB_COLOR
			-- HTML color Tan
		once
			create Result.set (24, 112, 175)
		end

	burlywood: HSB_COLOR
			-- HTML color Burlywood
		once
			create Result.set (24, 145, 179)
		end

	wheat: HSB_COLOR
			-- HTML color Wheat
		once
			create Result.set (29, 200, 209)
		end

	navajo_white: HSB_COLOR
			-- HTML color NavajoWhite
		once
			create Result.set (26, 255, 214)
		end

	bisque: HSB_COLOR
			-- HTML color Bisque
		once
			create Result.set (23, 255, 226)
		end

	blanched_almond: HSB_COLOR
			-- HTML color BlanchedAlmond
		once
			create Result.set (26, 255, 230)
		end

	cornsilk: HSB_COLOR
			-- HTML color Cornsilk
		once
			create Result.set (34, 255, 238)
		end

feature -- Access (purple, violet, and magenta colors)

	indigo: HSB_COLOR
			-- HTML color Indigo
		once
			create Result.set (195, 255, 65)
		end

	purple: HSB_COLOR
			-- HTML color Purple
		once
			create Result.set (213, 255, 64)
		end

	dark_magenta: HSB_COLOR
			-- HTML color DarkMagenta
		once
			create Result.set (213, 255, 70)
		end

	dark_violet: HSB_COLOR
			-- HTML color DarkViolet
		once
			create Result.set (200, 255, 106)
		end

	dark_slate_blue: HSB_COLOR
			-- HTML color DarkSlateBlue
		once
			create Result.set (176, 99, 100)
		end

	blue_violet: HSB_COLOR
			-- HTML color BlueViolet
		once
			create Result.set (192, 194, 135)
		end

	dark_orchid: HSB_COLOR
			-- HTML color DarkOrchid
		once
			create Result.set (198, 155, 127)
		end

	fuchsia: HSB_COLOR
			-- HTML color Fuchsia
		once
			create Result.set (213, 255, 128)
		end

	magenta: HSB_COLOR
			-- HTML color Magenta
		once
			create Result.set (213, 255, 128)
		end

	slate_blue: HSB_COLOR
			-- HTML color SlateBlue
		once
			create Result.set (176, 136, 148)
		end

	medium_slate_blue: HSB_COLOR
			-- HTML color MediumSlateBlue
		once
			create Result.set (176, 203, 171)
		end

	medium_orchid: HSB_COLOR
			-- HTML color MediumOrchid
		once
			create Result.set (204, 150, 148)
		end

	medium_purple: HSB_COLOR
			-- HTML color MediumPurple
		once
			create Result.set (184, 152, 166)
		end

	orchid: HSB_COLOR
			-- HTML color Orchid
		once
			create Result.set (214, 150, 165)
		end

	violet: HSB_COLOR
			-- HTML color Violet
		once
			create Result.set (213, 194, 184)
		end

	plum: HSB_COLOR
			-- HTML color Plum
		once
			create Result.set (213, 121, 191)
		end

	thistle: HSB_COLOR
			-- HTML color Thistle
		once
			create Result.set (213, 62, 204)
		end

	lavender: HSB_COLOR
			-- HTML color Lavender
		once
			create Result.set (170, 170, 240)
		end

feature -- Access (blue colors)

	midnight_blue: HSB_COLOR
			-- HTML color MidnightBlue
		once
			create Result.set (170, 162, 69)
		end

	navy: HSB_COLOR
			-- HTML color Navy
		once
			create Result.set (170, 255, 64)
		end

	dark_blue: HSB_COLOR
			-- HTML color DarkBlue
		once
			create Result.set (170, 255, 70)
		end

	medium_blue: HSB_COLOR
			-- HTML color MediumBlue
		once
			create Result.set (170, 255, 103)
		end

	blue: HSB_COLOR
			-- HTML color Blue
		once
			create Result.set (170, 255, 128)
		end

	royal_blue: HSB_COLOR
			-- HTML color RoyalBlue
		once
			create Result.set (159, 185, 145)
		end

	steel_blue: HSB_COLOR
			-- HTML color SteelBlue
		once
			create Result.set (147, 112, 125)
		end

	dodger_blue: HSB_COLOR
			-- HTML color DodgerBlue
		once
			create Result.set (149, 255, 143)
		end

	deep_sky_blue: HSB_COLOR
			-- HTML color DeepSkyBlue
		once
			create Result.set (138, 255, 128)
		end

	cornflower_blue: HSB_COLOR
			-- HTML color CornflowerBlue
		once
			create Result.set (155, 202, 169)
		end

	sky_blue: HSB_COLOR
			-- HTML color SkyBlue
		once
			create Result.set (140, 182, 185)
		end

	light_sky_blue: HSB_COLOR
			-- HTML color LightSkyBlue
		once
			create Result.set (144, 235, 193)
		end

	light_steel_blue: HSB_COLOR
			-- HTML color LightSteelBlue
		once
			create Result.set (152, 105, 199)
		end

	light_blue: HSB_COLOR
			-- HTML color LightBlue
		once
			create Result.set (138, 136, 202)
		end

	powder_blue: HSB_COLOR
			-- HTML color PowderBlue
		once
			create Result.set (132, 132, 203)
		end

feature -- Access (cyan colors)

	teal: HSB_COLOR
			-- HTML color Teal
		once
			create Result.set (128,255, 64)
		end

	dark_cyan: HSB_COLOR
			-- HTML color DarkCyan
		once
			create Result.set (128, 255, 70)
		end

	ligh_sea_green: HSB_COLOR
			-- HTML color LightSeaGreen
		once
			create Result.set (125, 177, 105)
		end

	cadet_blue: HSB_COLOR
			-- HTML color CadetBlue
		once
			create Result.set (129, 65, 128)
		end

	dark_turquoise: HSB_COLOR
			-- HTML color DarkTurquoise
		once
			create Result.set (128, 255, 105)
		end

	medium_turquoise: HSB_COLOR
			-- HTML color MediumTurquoise
		once
			create Result.set (126, 153, 141)
		end

	Turquoise: HSB_COLOR
			-- HTML color Turquiose
		once
			create Result.set (123, 184, 144)
		end

	aqua: HSB_COLOR
			-- HTML color Aqua
		once
			create Result.set (128, 255, 128)
		end

	cyan: HSB_COLOR
			-- HTML color Cyan
		once
			create Result.set (128, 255, 128)
		end

	aquamarine: HSB_COLOR
			-- HTML color Aquamarine
		once
			create Result.set (128, 255, 191)
		end

	pale_turquoise: HSB_COLOR
			-- HTML color PaleTrquoise
		once
			create Result.set (128, 166, 207)
		end

	light_cyan: HSB_COLOR
			-- HTML color LightCyan
		once
			create Result.set (128, 255, 240)
		end

feature -- Access (green colors)

	dark_green: HSB_COLOR
			-- HTML color DarkGreen
		once
			create Result.set (85, 255, 50)
		end

	green: HSB_COLOR
			-- HTML color Green
		once
			create Result.set (85, 255, 64)
		end

	dark_olive_green: HSB_COLOR
			-- HTML color DarkOliveGreen
		once
			create Result.set (58, 99, 77)
		end

	forest_green: HSB_COLOR
			-- HTML color ForestGreen
		once
			create Result.set (85, 155, 87)
		end

	see_green: HSB_COLOR
			-- HTML color SeaGreen
		once
			create Result.set (103, 128, 93)
		end

	olive: HSB_COLOR
			-- HTML color Olive
		once
			create Result.set (43, 255, 64)
		end

	olive_drab: HSB_COLOR
			-- HTML color OliveDrab
		once
			create Result.set (57, 154, 89)
		end

	medium_sea_green: HSB_COLOR
			-- HTML color MediumSeaGreen
		once
			create Result.set (104, 127, 120)
		end

	lime_green: HSB_COLOR
			-- HTML color LimeGreen
		once
			create Result.set (85, 155, 128)
		end

	lime: HSB_COLOR
			-- HTML color Lime
		once
			create Result.set (85, 255, 128)
		end

	spring_green: HSB_COLOR
			-- HTML color SpringGreen
		once
			create Result.set (106, 255, 128)
		end

	medium_spring_green: HSB_COLOR
			-- HTML color MediumSpringGreen
		once
			create Result.set (111, 255, 125)
		end

	dark_sea_green: HSB_COLOR
			-- HTML color DarkSeaGreen
		once
			create Result.set (85, 64, 166)
		end

	medium_aqua_marine: HSB_COLOR
			-- HTML color MediumAquaMarine
		once
			create Result.set (113, 129, 154)
		end

	yellow_green: HSB_COLOR
			-- HTML color YellowGreen
		once
			create Result.set (57, 155, 128)
		end

	lawn_green: HSB_COLOR
			-- HTML color LawnGreen
		once
			create Result.set (64, 255, 126)
		end

	chartreuse: HSB_COLOR
			-- HTML color Chartreuse
		once
			create Result.set (64, 255, 128)
		end

	light_green: HSB_COLOR
			-- HTML color LightGreen
		once
			create Result.set (85, 187, 191)
		end

	green_yellow: HSB_COLOR
			-- HTML color GreenYellow
		once
			create Result.set (60, 255, 151)
		end

	pale_green: HSB_COLOR
			-- HTML color PaleGreen
		once
			create Result.set (85, 236, 202)
		end

feature -- Access (white colors)

	misty_rose: HSB_COLOR
			-- HTML color MistyRose
		once
			create Result.set (4, 255, 240)
		end

	antique_white: HSB_COLOR
			-- HTML color AntiqueWhite
		once
			create Result.set (24, 198, 233)
		end

	Linen: HSB_COLOR
			-- HTML color Linen
		once
			create Result.set (21, 170, 240)
		end

	beige: HSB_COLOR
			-- HTML color Beige
		once
			create Result.set (43, 142, 233)
		end

	white_smoke: HSB_COLOR
			-- HTML color WhiteSmoke
		once
			create Result.set (0, 0, 245)
		end

	lavender_blush: HSB_COLOR
			-- HTML color LavenderBlush
		once
			create Result.set (241, 255, 248)
		end

	old_lace: HSB_COLOR
			-- HTML color OldLace
		once
			create Result.set (28, 217, 242)
		end

	alice_blue: HSB_COLOR
			-- HTML color AliceBlue
		once
			create Result.set (147, 255, 248)
		end

	seashell: HSB_COLOR
			-- HTML color Seashell
		once
			create Result.set (18, 255, 247)
		end

	ghost_white: HSB_COLOR
			-- HTML color GhostWhite
		once
			create Result.set (170, 255, 252)
		end

	honey_dew: HSB_COLOR
			-- HTML color HoneyDew
		once
			create Result.set (85, 255, 248)
		end

	floral_white: HSB_COLOR
			-- HTML color FloralWhite
		once
			create Result.set (28, 255, 248)
		end

	azure: HSB_COLOR
			-- HTML color Azure
		once
			create Result.set (128, 255, 248)
		end

	mint_green: HSB_COLOR
			-- HTML color MingGreen
		once
			create Result.set (106, 255, 250)
		end

	snow: HSB_COLOR
			-- HTML color Snow
		once
			create Result.set (0, 255, 253)
		end

	ivory: HSB_COLOR
			-- HTML color Ivory
		once
			create Result.set (43, 255, 248)
		end

	white: HSB_COLOR
			-- HTML color White
		once
			create Result.set (0, 0, 255)
		end

feature -- Access (gray and black colors

	black: HSB_COLOR
			-- HTML color Black
		once
			create Result.set (0, 0, 0)
		end

	dark_slate_gray: HSB_COLOR
			-- HTML color DarkSlateGray
		once
			create Result.set (128, 65, 63)
		end

	dim_gray: HSB_COLOR
			-- HTML color DimGray
		once
			create Result.set (0, 0, 105)
		end

	slate_gray: HSB_COLOR
			-- HTML color SlateGray
		once
			create Result.set (49, 32, 128)
		end

	gray: HSB_COLOR
			-- HTML color Gray
		once
			create Result.set (0, 0, 128)
		end

	light_slate_gray: HSB_COLOR
			-- HTML color LightSlateGray
		once
			create Result.set (149, 36, 136)
		end

	dark_gray: HSB_COLOR
			-- HTML color DarkGray
		once
			create Result.set (0, 0, 169)
		end

	silver: HSB_COLOR
			-- HTML color Silver
		once
			create Result.set (0, 0, 192)
		end

	light_gray: HSB_COLOR
			-- HTML color LightGray
		once
			create Result.set (0, 0, 211)
		end

	gainsboro: HSB_COLOR
			-- HTML color Gainsboro
		once
			create Result.set (0, 0, 220)
		end

end
