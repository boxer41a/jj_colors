note
	description: "Main window for this application."
	author: "Generated by the Vision Application Wizard."
	date: "$Date: 2018/11/10 18:53:9 $"
	revision: "1.0.1"

class
	MAIN_WINDOW

inherit

	EV_TITLED_WINDOW
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

create
	default_create

feature {NONE} -- Initialization

	create_interface_objects
			-- <Precursor>
		do
			Precursor {EV_TITLED_WINDOW}
			create h_split
			create left_split
			create right_split
				-- Create the views
			create hsb_spectrum_view
			create html_colors_view
			create hsb_color_summations_view
			create hsb_tweeker_view
			create hsb_blender_view
		end

	initialize
			-- Build the interface for this window.
		local
			hs: EV_HORIZONTAL_SPLIT_AREA
			vs: EV_VERTICAL_SPLIT_AREA
			mod_wc: EV_MODEL_WORLD_CELL
			sat_wc: EV_MODEL_WORLD_CELL
			add_wc: EV_MODEL_WORLD_CELL
		do
			Precursor {EV_TITLED_WINDOW}
			add_actions
			set_title ("{HSB_COLOR} Demo/Tester")
			extend (h_split)
			h_split.extend (left_split)
			h_split.extend (right_split)
			left_split.extend (hsb_spectrum_view)
			left_split.extend (html_colors_view)
			right_split.extend (hsb_tweeker_view)
			right_split.extend (hsb_blender_view)
				-- Position scrollbars
			html_colors_view.resize_if_necessary
			hsb_spectrum_view.resize_if_necessary
			hsb_color_summations_view.resize_if_necessary
--			hsb_blender_view.resize_if_necessary
		end

feature {NONE} -- Implementation, Close event

	request_close_window
			-- Process user request to close the window.
		do
			destroy
			if attached (create {EV_ENVIRONMENT}).application as a then
				a.destroy
			end
		end

feature {NONE} -- Implementation

	add_actions
			-- Add agent calls to the widgets
		do
			close_request_actions.extend (agent request_close_window)
		end

feature {NONE} -- Implementation / Constants

	h_split: EV_HORIZONTAL_SPLIT_AREA
			-- Put into Curent to divide into left and right half

	left_split: EV_VERTICAL_SPLIT_AREA
			-- Divide left half into a top and bottom

	right_split: EV_VERTICAL_SPLIT_AREA
			-- Divide right half into a top and bottom

	hsb_spectrum_view: HSB_SPECTRUM_VIEW
			-- Shows the vairous hues and effect changes to saturation and
			-- brightness has on a color.

	html_colors_view: HTML_COLORS_VIEW
			-- Shows the "HTML Extended Colors" colors described in:
			-- https://en.wikipedia.org/wiki/Web_colors

	hsb_color_summations_view: HSB_COLOR_SUMMATIONS_VIEW
			-- Shows the result of adding various colors together

	hsb_tweeker_view: HSB_TWEEKER_VIEW
			-- Has controls for changing hue, saturation, or brightness of
			-- and {HSB_COLOR} to compair it to an {EV_COLOR}

	hsb_blender_view: HSB_BLENDER_VIEW
			-- Allows a color to placed over another color to
			-- demontrate the alpha blending

end
