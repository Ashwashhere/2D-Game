class Vampire extends Enemy {

  Vampire(float y, float speedX, float speedY, PImage[] AnimationImages) {
    super(y, speedX, speedY, AnimationImages);
  }
  //pathfinding for vampires
  @Override
  void move() {
    if(survivor1.x - this.x < 0) {
      this.x -=1;
    } else {
      this.x+=1;
    }
    if(survivor1.y - this.y < 0) {
      this.y -=1;
    } else {
     this.y+=1; 
    }
  }
  
  
  @Override
    void render() {
    move();
    image(AnimationImages[0], x, y);
  }
}
