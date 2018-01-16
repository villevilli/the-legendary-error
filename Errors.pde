
 public static enum Errors {
    NUKED("Error Message nuked.png"),
    NO_INTERNET("Error Message.png"),
    EXPLORER_BUSY("explorer is busy.png"),
    INSTALL_LINUX("install linux.png"),
    VIRUS_DETECTED("virus detected.png");
  
    public String imageName;
  
    private Errors(String imageName){
      this.imageName = imageName;
    }
    
 }