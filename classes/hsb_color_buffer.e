note
	description: "[
		Code provided by Claude AI for bulk processing
		]"
	author:    "Jimmy J. Johnson"
	date:      "8/11/26"
	copyright: "Copyright (c) 2021, Jimmy J. Johnson"
	license:   "Eiffel Forum v2 (http://www.eiffel.com/licensing/forum.txt)"

class HSB_COLOR_BUFFER

create
    make

feature {NONE} -- Initialization

    make (n: INTEGER_32)
            -- Create a buffer of n colors, all zeroed.
        require
            positive_count: n > 0
        do
            create hues.make_filled (0, 1, n)
            create saturations.make_filled (0, 1, n)
            create brightnesses.make_filled (0, 1, n)
            create alphas.make_filled (0, 1, n)
        ensure
            count_set: count = n
        end

feature -- Access

    hues: ARRAY [NATURAL_8]
    saturations: ARRAY [NATURAL_8]
    brightnesses: ARRAY [NATURAL_8]
    alphas: ARRAY [NATURAL_8]

    count: INTEGER_32
        do
            Result := hues.count
        end

feature -- Element change

    put (h, s, b, a: NATURAL_8; i: INTEGER_32)
        require
            valid_index: i >= 1 and i <= count
        do
            hues[i] := h
            saturations[i] := s
            brightnesses[i] := b
            alphas[i] := a
        end

feature -- Bulk compositing

    over (fg, bg: HSB_COLOR_BUFFER): HSB_COLOR_BUFFER
            -- New buffer: fg composited over bg, channel-by-channel, via REAL_64.
        require
            fg_exists: fg /= Void
            bg_exists: bg /= Void
            same_count: fg.count = bg.count
        local
            i, n: INTEGER_32
            fg_a, bg_a, out_a: REAL_64
            hue_diff: INTEGER_32
            r_hue, r_sat, r_bright: NATURAL_8
        do
            n := fg.count
            create Result.make (n)
            from i := 1 until i > n loop
                fg_a := fg.alphas[i] / 255.0
                bg_a := (bg.alphas[i] / 255.0) * (1.0 - fg_a)
                out_a := fg_a + bg_a

                if out_a > 0.0 then
                    hue_diff := bg.hues[i].to_integer_32 - fg.hues[i].to_integer_32
                    if hue_diff > 127 then
                        hue_diff := hue_diff - 255
                    elseif hue_diff < -127 then
                        hue_diff := hue_diff + 255
                    end
                    r_hue := ((fg.hues[i].to_integer_32 + (hue_diff.to_double * bg_a / out_a).rounded + 255) \\ 255).to_natural_8
                    r_sat := ((fg.saturations[i] * fg_a + bg.saturations[i] * bg_a) / out_a).rounded.to_natural_8
                    r_bright := ((fg.brightnesses[i] * fg_a + bg.brightnesses[i] * bg_a) / out_a).rounded.to_natural_8
                else
                    r_hue := fg.hues[i]
                    r_sat := fg.saturations[i]
                    r_bright := fg.brightnesses[i]
                end

                Result.hues[i] := r_hue
                Result.saturations[i] := r_sat
                Result.brightnesses[i] := r_bright
                Result.alphas[i] := (out_a * 255.0).rounded.to_natural_8
                i := i + 1
            end
        ensure
            result_exists: Result /= Void
            same_count: Result.count = fg.count
        end

feature -- Bulk conversion

    make_from_rgb_arrays (r, g, b, a: ARRAY [NATURAL_8])
            -- Populate this buffer by converting parallel RGB(A) channel
            -- arrays to HSB, via REAL_64, one interleaved pass.
        require
            r_exists: r /= Void
            same_counts: g.count = r.count and b.count = r.count and a.count = r.count
        local
            i, n: INTEGER_32
            rn, gn, bn, mx, mn, delta, h, s, v: REAL_64
        do
            n := r.count
            create hues.make_filled (0, 1, n)
            create saturations.make_filled (0, 1, n)
            create brightnesses.make_filled (0, 1, n)
            create alphas.make_filled (0, 1, n)

            from i := 1 until i > n loop
                rn := r[i] / 255.0
                gn := g[i] / 255.0
                bn := b[i] / 255.0
                mx := rn.max (gn.max (bn))
                mn := rn.min (gn.min (bn))
                delta := mx - mn
                v := mx

                if mx = 0.0 then
                    s := 0.0
                else
                    s := delta / mx
                end

                if delta = 0.0 then
                    h := 0.0
                elseif mx = rn then
 -- fix me                   h := (((gn - bn) / delta) \\ 6.0) / 6.0
                elseif mx = gn then
                    h := (((bn - rn) / delta) + 2.0) / 6.0
                else
                    h := (((rn - gn) / delta) + 4.0) / 6.0
                end

                hues[i] := (h * 255.0 + 0.5).truncated_to_integer.to_natural_8
                saturations[i] := (s * 255.0 + 0.5).truncated_to_integer.to_natural_8
                brightnesses[i] := (v * 255.0 + 0.5).truncated_to_integer.to_natural_8
                alphas[i] := a[i]
                i := i + 1
            end
        ensure
            count_set: count = r.count
        end

    to_rgb_arrays: TUPLE [red, green, blue, alpha: ARRAY [NATURAL_8]]
            -- Convert this buffer to parallel RGBA channel arrays,
            -- via REAL_64, one interleaved pass.
        local
            i, n: INTEGER_32
            h, s, v, c, x, m, r, g, b: REAL_64
            sector: INTEGER_32
            red, green, blue: ARRAY [NATURAL_8]
        do
            n := count
            create red.make_filled (0, 1, n)
            create green.make_filled (0, 1, n)
            create blue.make_filled (0, 1, n)

            from i := 1 until i > n loop
                h := hues[i] / 255.0 * 6.0
                s := saturations[i] / 255.0
                v := brightnesses[i] / 255.0

                c := v * s
                sector := h.truncated_to_integer
                x := c * (1.0 - ((h - sector.to_double) - 1.0).abs)
                m := v - c

                inspect sector
                when 0 then r := c; g := x; b := 0.0
                when 1 then r := x; g := c; b := 0.0
                when 2 then r := 0.0; g := c; b := x
                when 3 then r := 0.0; g := x; b := c
                when 4 then r := x; g := 0.0; b := c
                else        r := c; g := 0.0; b := x
                end

                red[i] := ((r + m) * 255.0 + 0.5).truncated_to_integer.to_natural_8
                green[i] := ((g + m) * 255.0 + 0.5).truncated_to_integer.to_natural_8
                blue[i] := ((b + m) * 255.0 + 0.5).truncated_to_integer.to_natural_8
                i := i + 1
            end
            Result := [red, green, blue, alphas]
        end

end
