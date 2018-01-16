int origX;
int origY;
boolean alertOn;
int laskuri;
ArrayList<Window> ikkunat = new ArrayList();
Window captured;


void setup() {
  //size(255,255,P2D);
  fullScreen(P2D);
  background(255);
  
  newError(3);
}
void draw() {
  background(255);
  
    newError(int(random(5)));
  
  drawIkkunat();
}
void keyPressed(){
  newError(int(random(5)));
}
void mouseDragged() {

  int deltaX = mouseX - origX;
  int deltaY = mouseY - origY;
  origX = mouseX;
  origY = mouseY;
  if (captured != null) {
    captured.move(deltaX, deltaY);
    
    //captured.draw();
  }
  
}
void drawIkkunat() {
  for (Window ikkuna : ikkunat) {
    ikkuna.draw();
  }
}
void mousePressed() {
  for (Window ikkuna : ikkunat) {
    if (ikkuna.isInside(mouseX, mouseY)) {

      captured = ikkuna;
      origX = mouseX;
      origY = mouseY;
    }
  }
}
void mouseReleased() {
  captured = null;
}
Window newError(int errorPhoto){
  Window window = new Window();
  window.initalize();
  window.create(errorPhoto, 2/width, 2/height);
  ikkunat.add(window); 
  return(window);
}