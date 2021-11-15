# processing-surface
A simple implementation of a pixelarray surface into Processing


# Surface methods

#### Constructor(int width, int height)
	Initialise Surface pixelarray with given size

#### color Get(int x, int y)
	Returns a color value for the given position on the pixelarray

#### void Set(int x, int y, color c)
	Sets the color of the pixel at the given position

#### Surface GetRegion(int x, int y, int w, int h)
	Return a new Surface from the given rectangle region

#### void Fill(color c)
	Set all pixels in the Surface to the given color

#### void Clear()
	Set all pixels in the Surface to (0, 0, 0, 0)

#### void Line(int x1, int y1, int x2, int y2, int thickness, int c)
	Draw a line onto the Surface from point (x1, y1) to (x2, y2) with the given thickness and color

#### void Rect(int x, int y, int w, int h, color c)
	Draw a rectangle onto the Surface with the given position, dimensions and color

#### void Circle(int x, int y, int r, color c)
	Draw a circle onto the Surface at the given position with the given radius and color

#### void Blit(PImage image, int x, int y)
	Display an image onto the Surface at the given position

#### void SurfBlit(Surface surf, int x, int y)
	Display another Surface onto the Surface pixelarray at the given position

#### void SetAlpha(int a)
	Set the alpha for every pixel in the Surface to the given value

#### void SetColourKey(color c)
	Set every pixel that matches the given to color to full transparency

#### void Display(int x, int y)
	Display the Surface to the screen at the given position

#### void DisplayCenter(int x, int y)
	Display the Surface to the screen at the given position, centered

#### PImage GetImage()
	Return the Surface pixelarray as a PImage

#### Surface Copy()
	Return a copy of the Surface

#### int Width()
	Getter for the Surface width

#### int Height()
	Getter for the Surface height

#### int[] AsArray()
	Return the Surface as an int[] array

#### int[][] AsArray2D()
	Return the Surface as a 2D array
