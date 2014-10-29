
ImageAnalyser analyser;

void setup() {
  analyser = new ImageAnalyser("image.jpg");
  
  background(0);
  size(analyser.img.width, analyser.img.height);
}

void draw() {
  analyser.draw();
}
