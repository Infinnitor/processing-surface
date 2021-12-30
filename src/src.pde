Surface testSurf;
float x = 0;
float last;

void setup() {
	last = millis();
	size(800, 600);
	frameRate(500);

	testSurf = surface(width/2, height/2);
	testSurf.Rect(10, 10, testSurf.Width()-20, testSurf.Height()-20, color(155, 35, 35));

	Surface eye = surface(100, 100);
	eye.Circle(eye.Width()/2, eye.Height()/2, 45, color(200, 200, 200));
	eye.Circle(eye.Width()/2, eye.Height()/2, 27, color(1, 1, 1));

	testSurf.SurfBlit(eye, testSurf.Width()/2 - 100, testSurf.Height()/2, true);
	testSurf.SurfBlit(eye, testSurf.Width()/2 + 100, testSurf.Height()/2, true);
}


void draw() {
	float deltaTime = (millis() - last) / 1000;
	last = millis();

	background(55);
	text(frameRate, 50, 50);

	float moveAmt = 200*deltaTime;
	x  = (x > width+(testSurf.Width()/2)) ? -testSurf.Width() : x+moveAmt;
	testSurf.DisplayCentered((int) x, height/3);
}
