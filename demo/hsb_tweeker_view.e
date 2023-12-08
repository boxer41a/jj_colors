note
	description: "[
		A {VIEW} with controls to change the hue, saturation, or
		brightness of an {HSB_COLOR} to compair it to an {EV_COLOR}.
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/23"
	copyright: "Copyright (c) 2023, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	HSB_TWEEKER_VIEW

inherit

	EV_FIXED
		redefine
			create_interface_objects,
			initialize,
			is_in_default_state
		end

create
	default_create

feature {NONE} -- Initialization

	create_interface_objects
			-- Create the widgets
		local
			s: STRING
		do
			Precursor
			s := "class HSB_COLOR %N %
				%  creation %N %
				%       default_create, set, set_with_rgb, set_with_ev_color, %N %
				%  feature -- Access %N %
				%       hue: NATURAL_8 %N %
				%       saturation: NATURAL_8 %N %
				%       brightness: NATURAL_8 %N %
				%  feature -- Query %N %
				%       as_rgb: TUPLE [red, green, blue: REAL_32] %N %
				%       as_ev_color: EV_COLOR %N %
				%       as_grayscale: HSB_COLOR %N %
				% %N %
				% See index.html in the documentation directory."
			create instruction_label.make_with_text (s)
			instruction_label.align_text_left
			create red_label.make_with_text ("Red")
			create green_label.make_with_text ("Green")
			create blue_label.make_with_text ("Blue")
			create hue_label.make_with_text ("Hue")
			create saturation_label.make_with_text ("Saturation")
			create brightness_label.make_with_text ("Brightness")
			create red_spin.make_with_value_range (range)
			create green_spin.make_with_value_range (range)
			create blue_spin.make_with_value_range (range)
			create hue_spin.make_with_value_range (range)
			create saturation_spin.make_with_value_range (range)
			create brightness_spin.make_with_value_range (range)
				--
			s := "%NPick a color from one of the other views and drop it here..."
			create ev_color_display.make_with_text (s)
			s := "%N           or here"
			create hsb_color_display.make_with_text (s)
			create hsb_label
		end

	initialize
			-- Set up the view
		local
			x, y, gap: INTEGER
		do
			Precursor
			gap := 10
			set_minimum_size (500, 500)
			add_actions
				-- Set up and add widgets
			ev_color_display.disable_edit
			hsb_color_display.disable_edit
			extend (instruction_label)
				-- Spinner labels
			extend (red_label)
			extend (green_label)
			extend (blue_label)
			extend (hue_label)
			extend (saturation_label)
			extend (brightness_label)
				-- Spinners
			extend (red_spin)
			extend (green_spin)
			extend (blue_spin)
			extend (hue_spin)
			extend (saturation_spin)
			extend (brightness_spin)
				-- Color displays (i.e. text boxes with background)
			extend (ev_color_display)
			extend (hsb_color_display)
				-- Info about the {HSB_COLOR}
			extend (hsb_label)
			hsb_label.align_text_left
				-- Position widgets for {EV_COLOR}
			set_item_position (instruction_label, 60, 30)
				-- Red, green, and blue spinners and then labels
			x := instruction_label.x_position
			y := instruction_label.y_position + instruction_label.height + 3 * gap
			set_item_position (red_spin, x, y)
			x := red_spin.x_position + red_spin.width + gap
			set_item_position (green_spin, x, y)
			x := green_spin.x_position+ green_spin.width + gap
			set_item_position (blue_spin, x, y)
				-- labels
			x := red_spin.x_position
			y := red_spin.y_position - red_label.height
			set_item_position (red_label, x, y)
			x := green_spin.x_position
			set_item_position (green_label, x, y)
			x := blue_spin.x_position
			set_item_position (blue_label, x, y)
				-- EV_COLOR display
			x := red_spin.x_position
			y := red_spin.y_position + red_spin.height
			set_item_position (ev_color_display, x, y)
			set_item_size (ev_color_display, 300, 80)
				-- HSB_COLOR display
			y := ev_color_display.y_position + ev_color_display.height + gap
			set_item_position (hsb_color_display, x, y)
			set_item_size (hsb_color_display, 300, 80)
				-- HSB Spinners and labels
			y := hsb_color_display.y_position + hsb_color_display.height
			set_item_position (hue_spin, x, y)
			x := hue_spin.x_position + hue_spin.width + gap
			set_item_position (saturation_spin, x, y)
			x := saturation_spin.x_position + saturation_spin.width + gap
			set_item_position (brightness_spin, x, y)
				-- HSB Spinner labels
			x := hue_spin.x_position
			y := hue_spin.y_position + hue_spin.height
			set_item_position (hue_label, x, y)
			x := saturation_spin.x_position
			set_item_position (saturation_label, x, y)
			x := brightness_spin.x_position
			set_item_position (brightness_label, x, y)
				-- HSB label
			x := hue_spin.x_position
			y := hue_spin.y_position + 3 * hue_spin.height
			set_item_position (hsb_label, x, y)
			hsb_label.align_text_left
		end

feature {NONE} -- Implementation

	add_actions
			-- Add controls and displays to Current
		local

		do
			drop_actions.extend (agent on_drop_color)
			ev_color_display.drop_actions.extend (agent on_drop_color)
			hsb_color_display.drop_actions.extend (agent on_drop_color)
				-- RGB actions
			red_spin.change_actions.extend (agent update)
			green_spin.change_actions.extend (agent update)
			blue_spin.change_actions.extend (agent update)
				-- HSB actions
			hue_spin.change_actions.extend (agent update_hsb)
			saturation_spin.change_actions.extend (agent update_hsb)
			brightness_spin.change_actions.extend (agent update_hsb)
		end

	on_drop_color (a_color: EV_COLOR)
			-- React when an {EV_COLOR} is dropped on Current or
			-- on one of the widgets.
		do
			ev_color_display.remove_text
			hsb_color_display.remove_text
			red_spin.set_value (a_color.red_8_bit)
			green_spin.set_value (a_color.green_8_bit)
			blue_spin.set_value (a_color.blue_8_bit)
			update (0)
		end

	update (a_value: INTEGER)
			-- Update the widgets
			-- Argument `a_value' is not used
		local
			c: EV_COLOR
		do
			create c.make_with_8_bit_rgb (red_spin.value, green_spin.value, blue_spin.value)
			ev_color_display.set_background_color (c)
			initialize_hsb_values (a_value)
		end

	initialize_hsb_values (a_value: INTEGER)
			-- Set the values in the HSB-spinners using values derived
			-- from an {EV_COLOR} created from the RGB spinner values.
			-- Argument `a_value' is not used.
		local
			c: EV_COLOR
			hsb_c: HSB_COLOR
		do
				-- Create an {EV_COLOR}
			create c.make_with_8_bit_rgb (red_spin.value, green_spin.value, blue_spin.value)
				-- Create an {HSB_COLOR} from the {EV_COLOR}
			create hsb_c.set_with_ev_color (c)
				-- Create a new {EV_COLOR from the {HSB_COLOR} and
				-- set the background to that color
--			c := hsb_c.as_ev_color
--			hsb_color_display.set_background_color (c)
				-- Update the HSB spinners
			hue_spin.set_value (hsb_c.hue)
			saturation_spin.set_value (hsb_c.saturation)
			brightness_spin.set_value (hsb_c.brightness)
			update_hsb (0)
		end

	update_hsb (a_value: INTEGER)
			-- Update the color in the `hsb_color_display' based on
			-- the values in the HSB spinners.
			-- Argument `a_value' is not used.
		local
			c: EV_COLOR
			hsb_c: HSB_COLOR
			s: STRING
		do
				-- Create an {HSB_COLOR} from the spinner values
			create hsb_c.set (hue_spin.value, saturation_spin.value, brightness_spin.value)
				-- Create a new {EV_COLOR} from the {HSB_COLOR} and
				-- set the background to that color
			c := hsb_c.as_ev_color
			hsb_color_display.set_background_color (c)
				-- Display more info about the {HSB_COLOR} in a text
			s := "{HSB_COLOR} %N %
				%    out - " + hsb_c.out + "%N %
				%    out_in_degrees - " + hsb_c.out_in_degrees + "%N %
				%    out_in_rgb - " + hsb_c.out_in_rgb
			hsb_label.set_text (s)
		end

feature {NONE} -- Contract support

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := true
		end

feature {NONE} -- Implementation

	range: INTEGER_INTERVAL
			-- Used to set range for spin buttons
		once
			create Result.make (0, 255)
		end

	instruction_label: EV_LABEL
			-- Directs user to pick-and-put a color

	red_label: EV_LABEL
			-- "Red"

	green_label: EV_LABEL
			-- "Green"

	blue_label: EV_LABEL
			-- "Blue"

	hue_label: EV_LABEL
			-- "Hue"

	saturation_label: EV_LABEL
			-- "Saturation"

	brightness_label: EV_LABEL
			-- "Brightness"

	red_spin: EV_SPIN_BUTTON
			-- Used to change the red value of an {EV_COLOR}

	green_spin: EV_SPIN_BUTTON
			-- Used to change the green value of an {EV_COLOR}

	blue_spin: EV_SPIN_BUTTON
			-- Used to change the blue value of an {EV_COLOR}

	hue_spin: EV_SPIN_BUTTON
			-- Used to change the hue of an {HSB_COLOR}

	saturation_spin: EV_SPIN_BUTTON
			-- Used to change the saturation of an {HSB_COLOR}

	brightness_spin: EV_SPIN_BUTTON
			-- Used to change the brightness of an {HSB_COLOR}

	ev_color_display: EV_TEXT
			-- To show the {EV_COLOR} and attributes

	hsb_color_display: EV_TEXT
			-- To show the {HSB_COLOR} and attributes
			-- Note:  must used {EV_COLOR} to set background color

	hsb_label: EV_LABEL
			-- To display extra info about the {HSB_COLOR}

end
