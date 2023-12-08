note
	description: "[
		Draws a color over another to demonstrate blending of two
		{HSB_COLOR} objects using the `alpha' feature.
		The view has a `background' overwhich two overlapping areas,
		the `rectangle' and the `other_rectangle', are placed.  These
		two areas are alpha-blended with the background and with each
		other.  The overlaped area is divided into two regions, the
		`overlapped_rectangle' on the left and the `other_overlapped_-
		rectangle' on the right. 
		
		____________________________________________
		|                 `background'             |
		|                                          |
		|  ++++++++++++`rectangle'+++++++++++      |
		|  +                                +      |
		|  +                                +      |
		|  +  //////////////////////////////////// |
		|  +  /              :    other     +    / |
		|  +  /  overlapped  :  overlapped  +    / |
		|  +  /  rectangle   :  rectangle   +    / |
		|  +  /              :              +    / |
		|  +++/++++++++++++++++++++++++++++++    / |
		|     /                                  / |
		|     /                                  / |
		|     /       `other_rectangle'          / |
		|     //////////////////////////////////// |
		|                                          |
        |__________________________________________|
        		
		The color for the `overlapped_rectangle'
		is produced by blending using an RGB formula (i.e. the HSB
		values are converted to red-blue-green values and alpha-blended).
		The color for the `other_overlapped_rectangle' is produced from
		a formula that uses the `hue', `saturation', and `brightness'
		values of the {HSB_COLOR} directly.
		
		I used EV_TEXT for the rectangular areas because they reacted
		well to color changes.  I tried with EV_MODEL_RECTANGLE in a
		EV_MODEL_WORLD, but they did not get drawn right away (i.e. 
		there was an unaceptable delay between a spinner change and
		the color actually showing up.)
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/23"
	copyright: "Copyright (c) 2023, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	HSB_BLENDER_VIEW

inherit

	EV_FRAME
		rename
			background_color as frame_background_color
		redefine
			create_interface_objects,
			initialize,
			is_in_default_state
		end

inherit {NONE}

	HTML_EXTENDED_COLORS
		undefine
			default_create,
			copy,
			is_equal
		end

feature {NONE} -- Initialization

	create_interface_objects
			-- Create objects to be used by `Current' in `initialize'
			-- Implemented by descendants to create attached objects
			-- in order to adhere to void-safety due to the implementation
			-- bridge pattern.
		local
			s: STRING
		do
			Precursor {EV_FRAME}
			create fixed
			background_color := white.as_mutable
			rectangle_color := red.as_mutable
			other_rectangle_color := green.as_mutable
			overlapped_rectangle_color := dark_gray
			other_overlapped_rectangle_color := silver
				-- explain label
			s := "tell me something"
			create explain_label.make_with_text (s)
				-- `background' and controls
			create background
--			background.disable_sensitive
			s := "R = 0.000%NG = 0.000%NB = 0.000 %
				% %N%
				%H = 0.000%NS = 0.000%NB = 0.000%Na = 0.000"
			create background_text.make_with_text (s)
			background_text.align_text_left
			create background_hue_label.make_with_text ("Hue")
			create background_saturation_label.make_with_text ("Saturation")
			create background_brightness_label.make_with_text ("Brighness")
			create background_alpha_label.make_with_text ("Alpha")
			create background_hue_spin.make_with_value_range (range)
			create background_saturation_spin.make_with_value_range (range)
			create background_brightness_spin.make_with_value_range (range)
			create background_alpha_spin.make_with_value_range (range)
			background_alpha_spin.disable_sensitive
				-- `rectangle' and controls
			create rectangle
--			rectangle.disable_sensitive
			create rectangle_text.make_with_text (s)
			rectangle_text.align_text_left
			create background_text.make_with_text (s)
			create rectangle_hue_label.make_with_text ("Hue")
			create rectangle_saturation_label.make_with_text ("Saturation")
			create rectangle_brightness_label.make_with_text ("Brightness")
			create rectangle_alpha_label.make_with_text ("Alpha")
			create rectangle_hue_spin.make_with_value_range (range)
			create rectangle_saturation_spin.make_with_value_range (range)
			create rectangle_brightness_spin.make_with_value_range (range)
			create rectangle_alpha_spin.make_with_value_range (range)
				-- `other_rectangle' and controls
			create other_rectangle
			create other_rectangle_text.make_with_text (s)
			other_rectangle_text.align_text_left
			create other_hue_label.make_with_text ("Hue")
			create other_saturation_label.make_with_text ("Saturation")
			create other_brightness_label.make_with_text ("Brightness")
			create other_alpha_label.make_with_text ("Alpha")
			create other_hue_spin.make_with_value_range (range)
			create other_saturation_spin.make_with_value_range (range)
			create other_brightness_spin.make_with_value_range (range)
			create other_alpha_spin.make_with_value_range (range)
				-- `overlapped_rectangle' and text
			create overlapped_rectangle
			create overlapped_rectangle_text.make_with_text (s)
			overlapped_rectangle_text.align_text_left
				-- `other_overlapped_rectangle' and text
			create other_overlapped_rectangle
			create other_overlapped_rectangle_text.make_with_text (s)
			other_overlapped_rectangle_text.align_text_left
		end

	initialize
			-- Set up the view
		do
			Precursor {EV_FRAME}
			set_border_width (4)
			set_style ({EV_FRAME_CONSTANTS}.ev_frame_lowered)
			set_text ("Blender View")
			extend (fixed)
				-- Add the `explain_label'
			fixed.extend (explain_label)
				-- Add the `background' and controls
			fixed.extend (background)
			fixed.extend (background_text)
			fixed.extend (background_hue_label)
			fixed.extend (background_saturation_label)
			fixed.extend (background_brightness_label)
			fixed.extend (background_alpha_label)
			fixed.extend (background_hue_spin)
			fixed.extend (background_saturation_spin)
			fixed.extend (background_brightness_spin)
			fixed.extend (background_alpha_spin)
				-- Add `rectangle' and controls
			fixed.extend (rectangle)
			fixed.extend (rectangle_text)
			fixed.extend (rectangle_hue_label)
			fixed.extend (rectangle_saturation_label)
			fixed.extend (rectangle_brightness_label)
			fixed.extend (rectangle_alpha_label)
			fixed.extend (rectangle_hue_spin)
			fixed.extend (rectangle_saturation_spin)
			fixed.extend (rectangle_brightness_spin)
			fixed.extend (rectangle_alpha_spin)
				-- Add `other_rectangle' and controls
			fixed.extend (other_rectangle)
			fixed.extend (other_rectangle_text)
			fixed.extend (other_hue_label)
			fixed.extend (other_saturation_label)
			fixed.extend (other_brightness_label)
			fixed.extend (other_alpha_label)
			fixed.extend (other_hue_spin)
			fixed.extend (other_saturation_spin)
			fixed.extend (other_brightness_spin)
			fixed.extend (other_alpha_spin)
				-- Add `overlapped_rectangle'
			fixed.extend (overlapped_rectangle)
			fixed.extend (overlapped_rectangle_text)
				-- Add `other_overlapped_rectangle'
			fixed.extend (other_overlapped_rectangle)
			fixed.extend (other_overlapped_rectangle_text)
				-- Position the rectangles and text
			position_explain_label
			position_background
			position_rectangle
			position_other_rectangle
			position_overlapped_rectangles
				-- Initialize the colors of the rectangles
			on_drop_color (background, white.as_ev_color)
			on_drop_color (rectangle, red.as_ev_color)
			on_drop_color (other_rectangle, green.as_ev_color)
				-- Add actions to rectangles and controls
			add_actions
		end

feature {NONE} -- Implementation

	position_explain_label
			-- Position the `expain_label'
		local
			gap: INTEGER
			s: STRING
		do
			s := " Demonstrates color blending %N%N %
				% Two colored rectangles are placed over a background rectangle.%N %
				% The two foreground rectangles are blended with the background %N %
				% based on their alpha values and are also blended togeter pro- %N %
				% ducing the two smaller blended areas in the middle.  The left %N %
				% side is produced by first calculating the RGB values of the   %N %
				% two colors, calculating the blended values usng 64-bit reals, %N %
				% then converted back 8-bit natural `hue', `saturation', and    %N %
				%`brightness' values.                                           %N %
				% The right side shows an attempt to calculated the new blended %N %
				% color using only the attributes of {HSB_COLOR} (e.g. `hue',   %N %
				% `saturation', `brightness', and `alpha' without going through %N %
				% the convertion to RGB values."
			explain_label.set_text (s)
			explain_label.align_text_left
			fixed.set_item_position (explain_label, margin, margin)
		end

	position_background
			-- Position the `background' rectangle and controls
		local
			x, y, gap: INTEGER
		do
			gap := 4
				-- The background rectangle first, leaving room for controls
			x := margin
			y := explain_label.y_position + explain_label.height + 3 * margin
			fixed.set_item_position (background, x, y)
			fixed.set_item_size (background, background_width, background_height)

				-- Spinners on top of `background' (adjusted right toward center)
			x := background.x_position + 5 * margin
			y := background.y_position - background_hue_spin.height
			fixed.set_item_position (background_hue_spin, x, y)
			x := background_hue_spin.x_position + background_hue_spin.width + gap
			fixed.set_item_position (background_saturation_spin, x, y)
			x := background_saturation_spin.x_position + background_saturation_spin.width + gap
			fixed.set_item_position (background_brightness_spin, x, y)
			x := background_brightness_spin.x_position + background_brightness_spin.width + gap
			fixed.set_item_position (background_alpha_spin, x, y)
				-- Labels over the spinners
			x := background_hue_spin.x_position
			y := background_hue_spin.y_position - background_hue_label.height
			fixed.set_item_position (background_hue_label, x, y)
			x := background_saturation_spin.x_position
			fixed.set_item_position (background_saturation_label, x, y)
			x := background_brightness_spin.x_position
			fixed.set_item_position (background_brightness_label, x, y)
			x := background_alpha_spin.x_position
			fixed.set_item_position (background_alpha_label, x, y)
				-- Position the text
			x := background.x_position + background.width - background_text.width - margin
			y := background.y_position + gap
			fixed.set_item_position (background_text, x, y)
		end

	position_rectangle
			-- Position the `rectangle' (i.e. the one underneath the
			-- `other_rectangle') and its controls.
		local
			s, gap: INTEGER
			x, y: INTEGER
		do
			gap := 4
			s := 50
				-- Red, green, blue spinner and labels
			x := background.x_position + margin + margin
			y := background.y_position + margin + margin
				-- position spinners first
			fixed.set_item_position (rectangle_hue_spin, x, y)
			x := rectangle_hue_spin.x_position + rectangle_hue_spin.width + gap
			fixed.set_item_position (rectangle_saturation_spin, x, y)
			x := rectangle_saturation_spin.x_position + rectangle_saturation_spin.width + gap
			fixed.set_item_position (rectangle_brightness_spin, x, y)
			x := rectangle_brightness_spin.x_position + rectangle_brightness_spin.width + gap
			fixed.set_item_position (rectangle_alpha_spin, x, y)
				-- now position labels over the spinners
			x := rectangle_hue_spin.x_position
			y := rectangle_hue_spin.y_position - rectangle_hue_label.height
			fixed.set_item_position (rectangle_hue_label, x, y)
			x := rectangle_saturation_spin.x_position
			fixed.set_item_position (rectangle_saturation_label, x, y)
			x := rectangle_brightness_spin.x_position
			fixed.set_item_position (rectangle_brightness_label, x, y)
			x := rectangle_alpha_spin.x_position
			fixed.set_item_position (rectangle_alpha_label, x, y)
				-- First `rectangle'
			x := rectangle_hue_spin.x_position
			y := rectangle_hue_spin.y_position + rectangle_hue_spin.height + gap
			fixed.set_item_position (rectangle, x, y)
			fixed.set_item_size (rectangle, rec_width, rec_height)
				-- Position the text
			x := rectangle.x_position + gap
			y := rectangle.y_position + gap
			fixed.set_item_position (rectangle_text, x, y)
		end

	position_other_rectangle
			-- Position the `other_rectangle' and controls
		local
			gap: INTEGER
			x, y: INTEGER
			w, h: INTEGER
		do
			gap := 4
				-- Position `other_rectangle' relative to `rectangle'
			w := rec_width // overlap_ratio
			h := rec_height // overlap_ratio
			x := rectangle.x_position + w
			y := rectangle.y_position + h
			fixed.set_item_position (other_rectangle, x, y)
			fixed.set_item_size (other_rectangle, rec_width, rec_height)
				-- Other HSB labels and spinners
			x := other_rectangle.x_position
			y := other_rectangle.y_position + other_rectangle.height + gap
			fixed.set_item_position (other_hue_spin, x, y)
			x := other_hue_spin.x_position + other_hue_spin.width + gap
			fixed.set_item_position (other_saturation_spin, x, y)
			x := other_saturation_spin.x_position + other_saturation_spin.width + gap
			fixed.set_item_position (other_brightness_spin, x, y)
			x := other_brightness_spin.x_position + other_brightness_spin.width + gap
			fixed.set_item_position (other_alpha_spin, x, y)
			x := other_hue_spin.x_position
			y := other_hue_spin.y_position + other_hue_spin.height
			fixed.set_item_position (other_hue_label, x, y)
			x := other_saturation_spin.x_position
			y := other_saturation_spin.y_position + other_saturation_spin.height
			fixed.set_item_position (other_saturation_label, x, y)
			x := other_brightness_spin.x_position
			y := other_brightness_spin.y_position + other_brightness_spin.height
			fixed.set_item_position (other_brightness_label, x, y)
			x := other_alpha_spin.x_position
			y := other_alpha_spin.y_position + other_alpha_spin.height
			fixed.set_item_position (other_alpha_label, x, y)
				-- Position the text
			x := other_rectangle.x_position + other_rectangle.width - other_rectangle_text.width - margin
			y := other_rectangle.y_position + other_rectangle.height - other_rectangle_text.height - margin
			fixed.set_item_position (other_rectangle_text, x, y)
		end

	position_overlapped_rectangles
			-- Position the `overlapped_rectangle' and the `other_overlapped_rectangle'
			-- relative to `rectangle' and `other_rectangle' (i.e. show the overlapped
			-- regions).
		local
			x, y, h, w: INTEGER
			gap: INTEGER
		do
			gap := 4
				-- Position the `overlapped_rectangle'
			x := other_rectangle.x_position
			y := other_rectangle.y_position
			w := rectangle.width - rectangle.width // overlap_ratio
			h := rectangle.height - rectangle.height // overlap_ratio
			fixed.set_item_position (overlapped_rectangle, x, y)
			fixed.set_item_size (overlapped_rectangle, w // 2, h)
				-- Position the text
			x := overlapped_rectangle.x_position + gap
			y := overlapped_rectangle.y_position + gap
			fixed.set_item_position (overlapped_rectangle_text, x, y)
				-- Position the `other_overlapped_rectangle'
			x := overlapped_rectangle.x_position + overlapped_rectangle.width
			y := overlapped_rectangle.y_position
--			w := other_rectangle.x_position + other_rectangle.width - x
--			h := other_rectangle.y_position + other_rectangle.height
			fixed.set_item_position (other_overlapped_rectangle, x, y)
			fixed.set_item_size (other_overlapped_rectangle, w // 2, h)
				-- Position the text
			x := other_overlapped_rectangle.x_position + gap
			y := other_overlapped_rectangle.y_position + gap
			fixed.set_item_position (other_overlapped_rectangle_text, x, y)
		end

	add_actions
			-- Add actions to react to events
		do
			background.drop_actions.extend (agent on_drop_color (background, ?))
			rectangle.drop_actions.extend (agent on_drop_color (rectangle, ?))
			other_rectangle.drop_actions.extend (agent on_drop_color (other_rectangle, ?))
				-- Spinners
			background_hue_spin.change_actions.extend (agent update_background_color)
			background_saturation_spin.change_actions.extend (agent update_background_color)
			background_brightness_spin.change_actions.extend (agent update_background_color)
			rectangle_hue_spin.change_actions.extend (agent update_rectangle_color)
			rectangle_saturation_spin.change_actions.extend (agent update_rectangle_color)
			rectangle_brightness_spin.change_actions.extend (agent update_rectangle_color)
			rectangle_alpha_spin.change_actions.extend (agent update_rectangle_color)
			other_hue_spin.change_actions.extend (agent update_other_color)
			other_saturation_spin.change_actions.extend (agent update_other_color)
			other_brightness_spin.change_actions.extend (agent update_other_color)
			other_alpha_spin.change_actions.extend (agent update_other_color)
		end

feature {NONE} -- Basic operations

	on_drop_color (a_rectangle: like rectangle; a_color: EV_COLOR)
			-- React to the drop of a color on `a_rectangle' by
			-- updating the spinner values.
		local
			c: HSB_COLOR
		do
			create c.set_with_ev_color (a_color)
			if a_rectangle = background then
				background_hue_spin.set_value (c.hue)
				background_saturation_spin.set_value (c.saturation)
				background_brightness_spin.set_value (c.brightness)
				background_alpha_spin.set_value (c.alpha)
				update_background_color (0)
			elseif a_rectangle = rectangle then
					-- change `color' and spinner values
				rectangle_hue_spin.set_value (c.hue)
				rectangle_saturation_spin.set_value (c.saturation)
				rectangle_brightness_spin.set_value (c.brightness)
				rectangle_alpha_spin.set_value (c.alpha)
				update_rectangle_color (0)
			else
				other_hue_spin.set_value (c.hue)
				other_saturation_spin.set_value (c.saturation)
				other_brightness_spin.set_value (c.brightness)
				other_alpha_spin.set_value (c.alpha)
				update_other_color (0)
			end
		end

	update_background_color (a_value: INTEGER)
			-- Change the `background_color'
		local
			h, s, b: INTEGER
			ev_col: EV_COLOR
			str: STRING
		do
			h := background_hue_spin.value
			s := background_saturation_spin.value
			b := background_brightness_spin.value
			create background_color.set (h, s, b)
			ev_col := background_color.as_ev_color
			background.set_background_color (ev_col)
			str := "R = " + real_formatter.formatted (ev_col.red).out + "%N%
				%G = " + real_formatter.formatted (ev_col.green).out + "%N%
				%B = " + real_formatter.formatted (ev_col.blue).out + "%N%
				% %N%
				%H = " + int_formatter.formatted (background_color.hue).out + "%N%
				%S = " + int_formatter.formatted (background_color.saturation).out + "%N%
				%B = " + int_formatter.formatted (background_color.brightness).out + "%N%
				%a = " + int_formatter.formatted (background_color.alpha).out
			background_text.set_text (str)
			background_text.set_background_color (background_color.as_ev_color)
			background_text.set_foreground_color (background_color.complement.as_ev_color)
				-- Need to update the color of the other two rectangles and overlap
			update_rectangle_color (0)
			update_other_color (0)
		end

	update_rectangle_color (a_value: INTEGER)
			-- Change the background for `color'
		local
			h, s, b, a: INTEGER
			ev_col: EV_COLOR
			str: STRING
		do
			h := rectangle_hue_spin.value
			s := rectangle_saturation_spin.value
			b := rectangle_brightness_spin.value
			a := rectangle_alpha_spin.value
			rectangle_color.set_with_alpha (h, s, b, a)
			ev_col := rectangle_color.over (background_color).as_ev_color
			rectangle.set_background_color (ev_col)
			str := "R = " + real_formatter.formatted (ev_col.red).out + "%N%
				%G = " + real_formatter.formatted (ev_col.green).out + "%N%
				%B = " + real_formatter.formatted (ev_col.blue).out + "%N%
				% %N%
				%H = " + int_formatter.formatted (rectangle_color.hue).out + "%N%
				%S = " + int_formatter.formatted (rectangle_color.saturation).out + "%N%
				%B = " + int_formatter.formatted (rectangle_color.brightness).out + "%N%
				%a = " + int_formatter.formatted (rectangle_color.alpha).out
			rectangle_text.set_text (str)
			rectangle_text.set_background_color (ev_col)
			rectangle_text.set_foreground_color (rectangle_color.complement.as_ev_color)
				-- Update the overlapping region's color
			update_overlap
		end

	update_other_color (a_value: INTEGER)
			-- Change the background for `other_color'
		local
			h, s, b, a: INTEGER
			ev_col: EV_COLOR
			str: STRING
		do
			h := other_hue_spin.value
			s := other_saturation_spin.value
			b := other_brightness_spin.value
			a := other_alpha_spin.value
			other_rectangle_color.set_with_alpha (h, s, b, a)
			ev_col := other_rectangle_color.over (background_color).as_ev_color
			other_rectangle.set_background_color (ev_col)
			str := "R = " + real_formatter.formatted (ev_col.red).out + "%N%
				%G = " + real_formatter.formatted (ev_col.green).out + "%N%
				%B = " + real_formatter.formatted (ev_col.blue).out + "%N%
				% %N%
				%H = " + int_formatter.formatted (other_rectangle_color.hue).out + "%N%
				%S = " + int_formatter.formatted (other_rectangle_color.saturation).out + "%N%
				%B = " + int_formatter.formatted (other_rectangle_color.brightness).out + "%N%
				%a = " + int_formatter.formatted (other_rectangle_color.alpha).out
			other_rectangle_text.set_text (str)
			other_rectangle_text.set_background_color (ev_col)
			other_rectangle_text.set_foreground_color (other_rectangle_color.complement.as_ev_color)
				-- Update the overlapping region's color
			update_overlap
		end

	update_overlap
			-- Update the color of the overlapped regions
		local
			ev_col: EV_COLOR
			str: STRING
		do
				-- Calculate color using RGB formula in {HSB_COLOR}.over
			overlapped_rectangle_color := other_rectangle_color.over (rectangle_color)
			ev_col := overlapped_rectangle_color.as_ev_color
			overlapped_rectangle.set_background_color (ev_col)
			str := "R = " + real_formatter.formatted (ev_col.red).out + "%N%
				%G = " + real_formatter.formatted (ev_col.green).out + "%N%
				%B = " + real_formatter.formatted (ev_col.blue).out + "%N%
				% %N%
				%H = " + int_formatter.formatted (overlapped_rectangle_color.hue).out + "%N%
				%S = " + int_formatter.formatted (overlapped_rectangle_color.saturation).out + "%N%
				%B = " + int_formatter.formatted (overlapped_rectangle_color.brightness).out + "%N%
				%a = " + int_formatter.formatted (overlapped_rectangle_color.alpha).out
			overlapped_rectangle_text.set_text (str)
			overlapped_rectangle_text.set_background_color (ev_col)
			overlapped_rectangle_text.set_foreground_color (overlapped_rectangle_color.complement.as_ev_color)
				-- Calculate color using HSB formula in {HSB_COLOR}.`hsb_over'
			other_overlapped_rectangle_color := other_rectangle_color.hsb_over (rectangle_color)
			ev_col := other_overlapped_rectangle_color.as_ev_color
			other_overlapped_rectangle.set_background_color (ev_col)
			str := "R = " + real_formatter.formatted (ev_col.red).out + "%N%
				%G = " + real_formatter.formatted (ev_col.green).out + "%N%
				%B = " + real_formatter.formatted (ev_col.blue).out + "%N%
				% %N%
				%H = " + int_formatter.formatted (other_overlapped_rectangle_color.hue).out + "%N%
				%S = " + int_formatter.formatted (other_overlapped_rectangle_color.saturation).out + "%N%
				%B = " + int_formatter.formatted (other_overlapped_rectangle_color.brightness).out + "%N%
				%a = " + int_formatter.formatted (other_overlapped_rectangle_color.alpha).out
			other_overlapped_rectangle_text.set_text (str)
			other_overlapped_rectangle_text.set_background_color (ev_col)
			other_overlapped_rectangle_text.set_foreground_color (overlapped_rectangle_color.complement.as_ev_color)
		end

feature {NONE} -- Contract support

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := true
		end

feature {NONE} -- Implementation

	fixed: EV_FIXED
			-- Placed into Current to control widget placement

	range: INTEGER_INTERVAL
			-- Used to set range for spin buttons
		once
			create Result.make (0, {HSB_COLOR}.max_value)
		end

	margin: INTEGER = 20
			-- To move controls away from a windodw edge

	size_constant: INTEGER = 100
			-- Used to proportionally position other controls

	rec_width: INTEGER
			-- The default width of the rectangles
		once
			Result := 3 * size_constant
		end

	rec_height: INTEGER
			-- The default height of the rectangles
		once
			Result := 2 * size_constant
		end

	overlap_ratio: INTEGER = 3
			-- One over this value give the amount of overlap between
			-- the `rectangle' and the `other_rectangle'

	background_width: INTEGER
			-- The width of the `background' rectangle
		once
				-- 3 * margin to account for scrollbar
			Result := margin + rec_width + rec_width // overlap_ratio + 3 * margin
		end

	background_height: INTEGER
			-- The height of the `background' rectangle
		once
			Result := margin + rec_height + rec_height // overlap_ratio + margin
				-- Must account for height of the spin controls and labels
			Result := Result + 4 * margin
		end

feature {NONE} -- Implementation

	explain_label: EV_LABEL
			-- Instructions for use of this view

feature {NONE} -- Implementation

	background_color: MUTABLE_HSB_COLOR
			-- The color used for the `background'

	background_text: EV_LABEL
			-- Displays information about the `background_color'

	background: EV_TEXT
			-- Rectangular area serving as background color.

	background_hue_spin: EV_SPIN_BUTTON
			-- Changes the background color

	background_saturation_spin: EV_SPIN_BUTTON
			-- Changes the background color

	background_brightness_spin: EV_SPIN_BUTTON
			-- Changes the background color

	background_alpha_spin: EV_SPIN_BUTTON
			-- Changes the background color

	background_hue_label: EV_LABEL
			-- Label for a `background' spinner control

	background_saturation_label: EV_LABEL
			-- Label for a `background' spinner control

	background_brightness_label: EV_LABEL
			-- Label for a `background' spinner control

	background_alpha_label: EV_LABEL
			-- Label for a `background' spinner control

feature {NONE} -- Implementation

	rectangle: EV_TEXT
			-- Rectangle to display one color blended under the `other_rectangle'

	rectangle_text: EV_LABEL
			-- Displays information about the `rectangle_color'

	rectangle_color: MUTABLE_HSB_COLOR
			-- The color of the first `rectangle'

	rectangle_hue_label: EV_LABEL
			-- "Hue"

	rectangle_saturation_label: EV_LABEL
			-- "Saturation"

	rectangle_brightness_label: EV_LABEL
			-- "Brightness"

	rectangle_alpha_label: EV_LABEL
			-- "Alpha"

	rectangle_hue_spin: EV_SPIN_BUTTON
			-- Used to change the hue of an {HSB_COLOR}

	rectangle_saturation_spin: EV_SPIN_BUTTON
			-- Used to change the saturation of an {HSB_COLOR}

	rectangle_brightness_spin: EV_SPIN_BUTTON
			-- Used to change the brightness of an {HSB_COLOR}

	rectangle_alpha_spin: EV_SPIN_BUTTON
			-- Used to change the `alpha' value of an {HSB_COLOR}

feature {NONE} -- Implementation

	other_rectangle: EV_TEXT
			-- Rectangle to display the other color

	other_rectangle_text: EV_LABEL
			-- Displays information about the `other_rectangle_color'

	other_rectangle_color: MUTABLE_HSB_COLOR
			-- The other color to be placed over `color'

	other_hue_label: EV_LABEL
			-- "Hue"

	other_saturation_label: EV_LABEL
			-- "Saturation"

	other_brightness_label: EV_LABEL
			-- "Brightness"

	other_alpha_label: EV_LABEL
			-- "Alpha"

	other_hue_spin: EV_SPIN_BUTTON
			-- Used to change the hue of an {HSB_COLOR}

	other_saturation_spin: EV_SPIN_BUTTON
			-- Used to change the saturation of an {HSB_COLOR}

	other_brightness_spin: EV_SPIN_BUTTON
			-- Used to change the brightness of an {HSB_COLOR}

	other_alpha_spin: EV_SPIN_BUTTON
			-- Used to change the `alpha' value of an {HSB_COLOR}


feature {NONE} -- Implentation

	overlapped_rectangle: EV_TEXT
			-- Rectangle representing an area of overlap between the
			-- `rectangle' and the `other_rectangle', displaying a
			-- blended color calculated using RGB formula.
			-- The left half of the overlapped region

	overlapped_rectangle_text: EV_LABEL
			-- Displays information about the `other_rectangle_color'

	overlapped_rectangle_color: HSB_COLOR
			-- The color obtained from blending the colors of
			-- the `rectangle' and the `other_rectangle'
feature {NONE} -- Implentation

	other_overlapped_rectangle: EV_TEXT
			-- Rectangle representing an area of overlap between the
			-- `rectangle' and the `other_rectangle', displaying a
			-- blended color calculated using RGB formula.
			-- The left half of the overlapped region

	other_overlapped_rectangle_text: EV_LABEL
			-- Displays information about the `other_rectangle_color'

	other_overlapped_rectangle_color: HSB_COLOR
			-- The color obtained from blending the colors of
			-- the `rectangle' and the `other_rectangle'

feature {NONE} -- Implementation

	real_formatter: FORMAT_DOUBLE
			-- To format numbers
		once
			create Result.make (4, 3)
		end

	int_formatter: FORMAT_INTEGER
			-- To format integers
		once
			create Result.make (3)
		end
end
