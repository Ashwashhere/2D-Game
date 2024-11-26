class Survivor {
  int x = 650;
  int y = 350;
  PImage AnimationImages[] = new PImage[2];
    
  void Animate() {
    if(frameCounter < 31){
      fill(0);
      ellipse(x,y, 50,50);
    } else {
      fill(255,255,255);
      ellipse(x,y, 50,50);
    }
    
  }
}
