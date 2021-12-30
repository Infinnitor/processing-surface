# Methods for Surface

```processing
// Initialise Surface pixelarray with given size
Surface Constructor(int width, int height)

// Returns a color value for the given position on the pixelarray
color Get(int x, int y)

// Sets the color of the pixel at the given position
void Set(int x, int y, color c)

// Return a new Surface from the given rectangle region
Surface GetRegion(int x, int y, int w, int h)

// Set all pixels in the Surface to the given color
void Fill(color c)

// Set all pixels in the Surface to (0, 0, 0, 0)
void Clear()

// Draw a line onto the Surface from point (x1, y1) to (x2, y2) with the given thickness and color
void Line(int x1, int y1, int x2, int y2, int thickness, int c)

// Draw a rectangle onto the Surface with the given position, dimensions and color
void Rect(int x, int y, int w, int h, color c)

// Draw a circle onto the Surface at the given position with the given radius and color
void Circle(int x, int y, int r, color c)

// Display an image onto the Surface at the given position
void Blit(PImage image, int x, int y)

// Display another Surface onto the Surface pixelarray at the given position
void SurfBlit(Surface surf, int x, int y)

// Set the alpha for every pixel in the Surface to the given value
void SetAlpha(int a)

// Change the alpha for every pixel in the Surface by the given value
void ShiftAlpha(int a)

// Set every pixel that matches the given to color to full transparency
void SetColourKey(color c)

// Display the Surface to the screen at the given position
void Display(int x, int y)

// Display the Surface to the screen at the given position, centered
void DisplayCenter(int x, int y)

// Return the Surface pixelarray as a PImage
PImage GetImage()

// Return a copy of the Surface
Surface Copy()

// Getter for the Surface width
int Width()

// Getter for the Surface height
int Height()

// Return the Surface as an int[] array
int[] AsArray()

// Return the Surface as a 2D array
int[][] AsArray2D()
```

# Associated functions for Surface
```processing
// Create a surface with the given width and height. You can use this instead of the Surface constructor
Surface surface(int w, int h)

// Create a surface from a given PImage. The new surface will be the same size and have the same content as the PImage
Surface surfaceFromImage(PImage image)
```

# Methods for SpriteSheet
```processing
// Constructs SpriteSheet by dividing up the given PImage, based on the spriteW and spriteH arguments
SpriteSheet Constructor(PImage sheet, int spriteW, int spriteH)

// Returns a copy of the SpriteSheet
SpriteSheet Copy()

// Get a sprite in the SpriteSheet at the given index
Surface Get(int index)

// Getter for the width of the sprites in the SpriteSheet
int Width()

// Getter for the height of the sprites in the SpriteSheet
int Height()
```

# Associated functions for SpriteSheet

```processing
// Creates a SpriteSheet from a given path. The path must point to an image that can be loaded as a PImage
SpriteSheet spritesheetFromPath(String p, int w, int h)

// Creates a SpriteSheet from a given Surface
SpriteSheet spriteSheetFromSurface(Surface s, int w, int h)
```
