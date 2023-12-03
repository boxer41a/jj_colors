note
	description: "[
		Table holding {HSB_COLOR} paired with a name, allowing
		seach by string to find a color or search by color to
		find a name.
		]"
	author:    "Jimmy J. Johnson"
	date:      "11/11/21"
	copyright: "Copyright (c) 2021, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class
	HSB_COLOR_TABLE

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
			create table_imp.make (20)
		end

feature -- Access

	item_for_iteration: HSB_COLOR
			-- Element at current iteration position
		require
			not_off: not is_off
		do
			Result := table_imp.item_for_iteration
		end

	key_for_iteration: STRING
			-- Key at current iteration position
		require
			not_off: not is_off
		do
			Result := table_imp.key_for_iteration
		end

feature -- Query

	color (a_name: STRING): HSB_COLOR
			-- The color associated with `a_name'
		require
			has_name: has (a_name)
		do
			Result := table_imp.definite_item (a_name)
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
			until attached str or else table_imp.after
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

feature -- Status report

	is_after: BOOLEAN
			-- Is the cursor after the last item?
		do
			Result := table_imp.after
		end

	is_off: BOOLEAN
			-- Is the cursor after the last item?
		do
			Result := table_imp.off
		end

feature -- Basic operations

	extend (a_color: HSB_COLOR; a_name: STRING)
			-- Add `a_color' to the table, associating it with `a_name'
		require
			not_has_key: not has (a_name)
		do
			table_imp.extend (a_color, a_name)
		end

	start
			-- Move to first item in table
		do
			table_imp.start
		end

	forth
			-- Move to next color or after	
		require
			not_after: not is_after
		do
			table_imp.forth
		end

feature {NONE} -- Implementatin

	table_imp: HASH_TABLE [HSB_COLOR, STRING]
			-- Holds basic colors index by a name

end
