note
	description: "[
		Provides access to various stock colors
		]"
	author: "Jimmy J Johnson"
	date: "9/11/26"
	copyright: "Copyright (c) 2026, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

deferred class
	HSB_COLOR_FACTORY

feature -- Access

	count: INTEGER
			-- The number of colors in Current
		do
			Result := table_imp.count
		end

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

	item: TUPLE [color: HSB_COLOR; name: STRING_8]
			-- the item and key at current iteration position
		require
			not_off: not is_off
		do
			Result := [item_for_iteration, key_for_iteration]
		end

feature -- Status report

	is_after: BOOLEAN
			-- Is the cursor after the last item?
		do
			Result := table_imp.is_after
		end

	is_off: BOOLEAN
			-- Is the cursor after the last item?
		do
			Result := table_imp.is_off
		end

feature -- Basic operations

	start
			-- Bring cursor to first position.
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

feature {NONE} -- Implementation

	table_imp: HSB_COLOR_TABLE
			-- Holds the basic colors for lookup in features
			-- `color' and `color_name'
		deferred
		ensure
			table_exists: Result /= Void
		end

end
