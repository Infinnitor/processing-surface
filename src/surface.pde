// Surface class
public final class Surface {

	// Use getters
	private PImage CONTENT;
	private int w;
	private int h;

	public Surface(int givenW, int givenH) {
		w = givenW; h = givenH;

		CONTENT = createImage(w, h, ARGB);
	}

	private int Loc(int x, int y) {
		return (y*w) + x;
	}

	// Return colour at given position
	// This function is slow to use, avoid using it for getting many pixels
	// Use Surface.GetImage().pixels[] instead
	public color Get(int x, int y) {
		return CONTENT.get(x, y);
	}

	// Set colour at a given position
	// This function is slow to use, avoid using it for setting many pixels
	public void Set(int x, int y, color setC) {
		CONTENT.set(x, y, setC);
	}

	// Return a new Surface, set to the given rect region
	public Surface GetRegion(int rX, int rY, int rW, int rH) {
		PImage newSurfImage = createImage(rW, rH, ARGB);

		for (int y=0; y < rH; y++) {
			for (int x=0; x < rW; x++) {
				newSurfImage.set(x, y, this.Get(x+rX, y+rY));
			}
		}

		Surface retSurf = new Surface(newSurfImage.width, newSurfImage.height);
		retSurf.Blit(newSurfImage, 0, 0);
		return retSurf;
	}

	// Fill the surface pixels with one colour
	public void Fill(color fillC) {
		CONTENT.loadPixels();

		for (int y=0; y < h; y++) {
			for (int x=0; x < w; x++) {
				// this.Set(x, y, fillC);
				CONTENT.pixels[Loc(x, y)] = fillC;
			}
		}
		CONTENT.updatePixels();

	}

	// Set all pixels to full transparency
	public void Clear() {
		this.Fill(color(0, 0, 0, 0));
	}


	// This function is kinda working maybe
	public void Line(int x1, int y1, int x2, int y2, int thickness, color lineC) {
		int fullDist = int(dist(x1, y1, x2, y2));
		float angleTo = atan2(y2-y1, x2-x1);

		float xmove = cos(angleTo);
		float ymove = sin(angleTo);

		for (int h=0; h < fullDist; h++) {
			//Set(int(h*xmove), int(h*ymove), lineC);
			Rect(x1+int(h*xmove)-thickness/2, y1+int(h*ymove)-thickness/2, thickness, thickness, lineC);
		}
	}

	// Draw a rectangle to the surface pixels
	public void Rect(int rX, int rY, int rW, int rH, color rectC) {
		CONTENT.loadPixels();
		for (int y=0; y < rH; y++) {
			for (int x=0; x < rW; x++) {
				if (x+rX < 0 || y+rY < 0) { continue; }
				if (x+rX >= w || y+rY >= h) { continue; }
				CONTENT.pixels[Loc(x+rX, y+rY)] = rectC;
			}
		}
		CONTENT.updatePixels();
	}

	// This function is unoptimized so maybe dont use it
	public void Circle(int cX, int cY, int r, color circleFill) {
		for (int a=0; a < 360; a++) {
			int x2 = cX + int(cos(radians(a)) * r);
			int y2 = cY + int(sin(radians(a)) * r);

			Line(cX, cY, x2, y2, 4, circleFill);
		}
	}

	// Given a PImage, blit its pixels to the surface pixels
	public void Blit(PImage blitImg, int blitX, int blitY, boolean... centered) { // Use boolean varargs for centered to make it optional
		boolean offsetCenter = (centered.length > 0) ? (centered[0] == true) : false;
		blitX = (offsetCenter) ? blitX - blitImg.width/2 : blitX;
		blitY = (offsetCenter) ? blitY - blitImg.height/2 : blitY;

		CONTENT.loadPixels();
		for (int y=0; y < blitImg.height; y++) {
			for (int x=0; x < blitImg.width; x++) {
				if (alpha(blitImg.get(x, y)) == 0) {
					continue;
				}
				if (x+blitX < 0 || y+blitY < 0) { continue; }
				if (x+blitX >= w || y+blitY >= h) { continue; }

				CONTENT.pixels[Loc(x+blitX, y+blitY)] = blitImg.get(x, y);
				// this.Set(x+blitX, y+blitY, blitImg.get(x, y));
			}
		}
		CONTENT.updatePixels();
	}

	// Given another Surface, blit its pixels to the surface pixels
	public void SurfBlit(Surface blitSurf, int blitX, int blitY, boolean... centered) {
		boolean offsetCenter = (centered.length > 0) ? (centered[0] == true) : false;
		this.Blit(blitSurf.GetImage(), blitX, blitY, offsetCenter); // Use Surface.Blit() to avoid repetition
	}

	// Display the surface to the screen
	public void Display(int x, int y) {
		image(CONTENT, x, y);
	}

	// Display the surface to the screen, from its center
	public void DisplayCenter(int x, int y) {
		image(CONTENT, x - (w/2), y - (h/2));
	}

	public void SetAlpha(int newAlpha) {
		CONTENT.loadPixels();

		for (int y=0; y < h; y++) {
			for (int x=0; x < w; x++) {
				color pixelGet = this.Get(x, y);

				// Bitwise stuff
				// It's cool
				float r = pixelGet >> 16 & 0xFF;
				float g = pixelGet >> 8 & 0xFF;
				float b = pixelGet & 0xFF;

				CONTENT.pixels[Loc(x, y)] = color(int(r), int(g), int(b), newAlpha);
				// this.Set(x, y, color(int(r), int(g), int(b), newAlpha));
			}
		}
		CONTENT.updatePixels();

	}

	public void ShiftAlpha(int changeAmt) {
		CONTENT.loadPixels();

		for (int y=0; y < h; y++) {
			for (int x=0; x < w; x++) {
				color pixelGet = this.Get(x, y);

				// Bitwise stuff
				// It's cool
				float r = pixelGet >> 16 & 0xFF;
				float g = pixelGet >> 8 & 0xFF;
				float b = pixelGet & 0xFF;

				CONTENT.pixels[Loc(x, y)] = color(int(r), int(g), int(b), alpha(pixelGet) + changeAmt);
				// this.Set(x, y, color(int(r), int(g), int(b), alpha(pixelGet) + changeAmt));
			}
		}
		CONTENT.updatePixels();
	}

	// Set all pixels that match the colourKey argument to transparency
	public void SetColourKey(color colourKey) {
		color fullTransparent = color(0, 0, 0, 0);
		CONTENT.loadPixels();

		for (int y=0; y < h; y++) {
			for (int x=0; x < w; x++) {
				if (CONTENT.pixels[Loc(x, y)] == colourKey) {
					CONTENT.pixels[Loc(x, y)] = fullTransparent;
					// this.Set(x, y, fullTransparent);
				}
			}
		}
		CONTENT.updatePixels();
	}

	// Access method for the surface PImage
	public PImage GetImage() {
		return CONTENT;
	}

	public Surface Copy() {
		Surface copiedSurface = new Surface(this.w, this.h);
		copiedSurface.Blit(this.GetImage(), 0, 0);
		return copiedSurface;
	}

	// Access method for the surface width
	public int Width() {
		return this.w;
	}

	// Access method for the surface height
	public int Height() {
		return this.h;
	}

	// Access method for the surface size, as an int[2]
	public int[] Size() {
		return new int[] {this.w, this.h};
	}

	// Access method for the surface pixels, as an int array
	public int[] AsArray() {
		int[] pxArray = new int[w*h];

		for (int y=0; y < h; y++) {
			for (int x=0; x < w; x++) {
				pxArray[y*x] = this.Get(x, y);
			}
		}
		return pxArray; // Modifying returned array does not affect the surface
	}

	// Access method for the surface pixels, as a 2D int array
	public int[][] AsArray2D() {
		int[][] pxArray = new int[w][h];

		for (int y=0; y < h; y++) {
			for (int x=0; x < w; x++) {
				pxArray[x][y] = this.Get(x, y);
			}
		}
		return pxArray; // Modifying returned array does not affect the surface
	}
}


// Function for making a new Surface, similar to other processing functions
public Surface surface(int w, int h) {
	return new Surface(w, h);
}

// Function for making a new Surface from an image
public Surface surfaceFromImage(PImage img) {
	Surface retSurf = new Surface(img.width, img.height);
	retSurf.Blit(img, 0, 0);
	return retSurf;
}
