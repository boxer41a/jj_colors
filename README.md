# jj_colors
An Eiffel implementation of the Hue-Saturation-Brightness (HSB) color model implemented with 8-bit values.
 
Class [HSB_COLOR](./classes/hsb\_color.e) describes a color using a modified HSB model.  Instead of using real values in the range [0..1] or degrees from [0..360], this model uses NATURAL_8 as the type for the '*hue*', '*saturation*', '*brightness*', and '*alpha*', requiring only 32 bits (plus object overhead, of course).

To picture this HSB model, think of a sphere centered on the origin with a radius measured in units scaled to fit 360 degrees into a NATURAL_8 number), where:

1. `*hue*' - the particular color given by the degrees from the red-axis, where red is at 0 units, progressing through yellow at 43 units (60-degrees), green is at 85 units (120 degrees), cyan is at 128 units (180 degrees), blue is at 170 units (240 degrees), Magenta  is at 213 units (300 degrees), with tertiary and other colors spaced accordingly.
2. '*saturation*' - the amount of a given color measured as the distance from the origin towards the edge of the sphere. (A fully saturated red is on the sphere while a less saturated red would be somewhere inside the sphere.)  As the `saturation' approaches zero, the color appears more and more white.
3. `*brightness*' - the way a color appears relative to white is the angle in units measured up from the negative z-axis, with zero units (0 degrees or straight down) appearing totally black/dark, 128 units (90 degrees or on the sphere's equator) is a "pure" color, and 255 units (180 degrees, or straight up) appears totally bright/white.
4. '*Alpha*' - the transparency, ranges from zero units (totally transparent) to 255 units (totally opaque).

To display an [HSB_COLOR](./classes/hsb_color.e) using the EV\_xxx classes of EiffelVision, obtain the equivalent EV\_COLOR with feature `*as\_ev\_color*'.

An [HSB_COLOR](./classes/hsb_color.e) is immutable (i.e. it has no setters beyond the creation features).  Obtain a modifiable [.MUTABLE\_HSB\_COLOR](./classes/mutable_\hsb_\color.e) with feature `as_mutable'.

