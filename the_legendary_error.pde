int origX;
int origY;
boolean alertOn;
int laskuri;
ArrayList<Window> ikkunat = new ArrayList();
Window captured;
PImage background;


void setup() {
  //size(255,255,P2D);
  fullScreen(P2D);
  background(255);
  background = loadImage("windows xp background.png");
  newError(3);
}
void draw() {
  image(background,0 ,0 ,width ,height);
  newError(int(random(5)));

  drawIkkunat();
}
void keyPressed() {
  if(int(random(1000000))==1)
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
  int laskuri;
  for (Window ikkuna : ikkunat) {
    laskuri =+1;
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
Window newError(int errorPhoto) {
  Window window = new Window();
  window.initalize();
  window.create(errorPhoto, int (random(width)), int (random(height)));
  ikkunat.add(window); 
  return(window);
}