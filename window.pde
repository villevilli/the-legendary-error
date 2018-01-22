public class Window {
  int windowX;
  int windowY;
  int grabareaWidth;
  int grabareaHeight;
  PImage windowPhoto;
  /*PImage error1;
  PImage error2;
  PImage error3;
  PImage error4;
  PImage error5;*/
  ArrayList<PImage> errors = new ArrayList<PImage>();

  public void initalize() {


    for(ErrorType et: ErrorType.values()){
      PImage errorImage = loadImage(et.imageName);
      et.image = errorImage;
      errors.add(errorImage);
    }
   
  }
  
  public void create(ErrorType errorType, int x, int y) {

    this.windowX = x;
    this.windowY = y;
    this.windowPhoto = errorType.image;
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