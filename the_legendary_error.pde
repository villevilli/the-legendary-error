int origX;
int origY;
boolean alertOn;
int laskuri = 0;
ArrayList<Window> ikkunat = new ArrayList();
Window captured;
PImage background;
PImage rip_you;
int maxErrors =20;


void setup() {
  rip_you = loadImage("your computer is infected with virus.png");
  //size(1000, 500, P2D);
  fullScreen(P2D);
  frameRate(200);
  background(255);
  background = loadImage("windows xp background.png");
}
void draw() {
  if (captured != null) {
    moveLast(captured);
  }
  image(background, 0, 0, width, height);

  
  if (int(random(20))==1 && maxErrors == 0) {
    laskuri += 1;
    newError(getRandomErrorType());
  }
  if (int(random(20))==1 && laskuri < maxErrors) {
    laskuri += 1;
    newError(getRandomErrorType());
  }
  if (int(random(10))==1 && maxErrors == 0) {
    laskuri += 1;
    newError(getRandomErrorType());
  }
  drawIkkunat();
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
  println(mouseX);
  println(mouseY);
  Window selected = new Window(); 
  for (Window ikkuna : ikkunat) {
    if (ikkuna.isInside(mouseX, mouseY)) {
      captured = ikkuna;
      origX = mouseX;
      origY = mouseY;
      selected = ikkuna;
    }
  }
}
void mouseReleased() {
  captured = null;
}
Window newError(ErrorType errorType) {
  Window window = new Window();
  window.initalize();
  window.create(errorType, int (random(width)), int (random(height)));
  ikkunat.add(window); 
  return(window);
}
public ErrorType getRandomErrorType() {
  int length = ErrorType.values().length;
  int errorIndex = int(random(length));
  ErrorType[] errorTypes = ErrorType.values();
  return errorTypes[errorIndex];
}
void moveLast(Window moveMe) {
  ikkunat.remove(moveMe);
  ikkunat.add(moveMe);
}