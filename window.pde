public class Window {
  int windowX;
  int windowY;
  int grabareaWidth;
  int grabareaHeight;
  PImage windowPhoto;
  PImage error1;
  PImage error2;
  PImage error3;
  PImage error4;
  PImage error5;
  ArrayList<PImage> errors = new ArrayList<PImage>();

  public void initalize() {



    error1 = loadImage(Errors.NUKED.imageName);
    error2 = loadImage(Errors.NO_INTERNET.imageName);
    error3 = loadImage(Errors.EXPLORER_BUSY.imageName);
    error4 = loadImage(Errors.INSTALL_LINUX.imageName);
    error5 = loadImage(Errors.VIRUS_DETECTED.imageName);
    errors.add(error1);
    errors.add(error2);
    errors.add(error3);
    errors.add(error4);
    errors.add(error5);
  }
  public void create(int errorNumber, int x, int y) {

    this.windowX = x;
    this.windowY = y;
    this.windowPhoto = errors.get(errorNumber);
    this.grabareaWidth = windowPhoto.width;
    this.grabareaHeight = 25;
  }
  public void draw() {
    if (windowPhoto==null) {
      return;    
    }
    fill(255);
    textSize(20);
    fill(0);

    image(windowPhoto, windowX, windowY);
  }
  public void move(int dX, int dY) {
    windowX = windowX + dX;
    windowY = windowY + dY;
  }
  public boolean isInside(int x, int y) {
    if (x>=windowX && x<= windowX+grabareaWidth
      && y>=windowY && y<= windowY+grabareaHeight) {
      return true;
    }
    return false;
  }
}