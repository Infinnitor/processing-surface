public class SpriteSheet {
	private String filePath;

	private Surface SHEET;
	private ArrayList<Surface> SPRITES = new ArrayList<Surface>();

	// Use getters
	private int w;
	private int h;

	public SpriteSheet(String sheetPath, int spriteW, int spriteH) {
		filePath = sheetPath;
		w = spriteW;
		h = spriteH;

		PImage sheetImage = loadImage(filePath);
		SHEET = surfaceImage(sheetImage);

		// Divide PImage up into Surfaces 
		Surface regionFromSheet = new Surface(spriteW, spriteH);
		for (int y=0; y < SHEET.Height()/spriteH; y++) {
			for (int x=0; x < SHEET.Width()/spriteW; x++) {
				regionFromSheet.Clear();
				regionFromSheet.SurfBlit(SHEET.GetRegion(x*spriteW, y*spriteH, (x*spriteW) + spriteW, (y*spriteH) + spriteH), 0, 0);
				SPRITES.add(regionFromSheet.Copy());
			}
		}
	}

	public Surface Get(int index) {
		return SPRITES.get(index);
	}

	// Read only attribute
	public String Path() {
		return filePath;
	}

	public int Width() {
		return this.w;
	}

	public int Height() {
		return this.h;
	}
}
