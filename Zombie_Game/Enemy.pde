int currentImage;

abstract class Enemy {
  float x;
  float y = 330;
  float speedX;
  float speedY;
  PImage AnimationImages[] = new PImage[3];

  //Normal constructor
  Enemy(float x, float speedX, PImage[] AnimationImages) {
    this.speedX = speedX;
    this.AnimationImages = AnimationImages;
    this.x=x;  
  }

  //Constructor for enemies that can fly
  Enemy(float y, float speedX, float speedY, PImage[] AnimationImages) {
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;
    this.AnimationImages = AnimationImages;
  }

  void render() {
    Animation();
    image(AnimationImages[currentImage], x, y);
    move();
  }

  void move() {
    if (x < survivor1.x) {
      x = x + speedX;
    } else {
      x = x - speedX;
    }
    if (y< survivor1.y) {
      y = y + speedY;
    } else {
      y = y - speedX;
    }
  }

  void Animation() {
    if (frameCounter > 0 && frameCounter < 21) {
      currentImage = 0;
    } else if (frameCounter > 20 && frameCounter < 31) {
      currentImage = 1;
    } else {
      currentImage = 2;
    }
  }

  //detects whether the enemy objects have collided with the survivor
  
  void collisionSurvivor() {
   if(abs(this.x-650) < 50 && abs(this.y-350) < 50) {
     lives -= 1;
   }
  }
  
  
  boolean mouseCollisionDetection(float mouseX, float mouseY) {
    if (abs(this.x-mouseX) < zombieAnimationImages[1].width && abs(this.y - mouseY) < zombieAnimationImages[1].height && mousePressed == true) {
      return true;
    } else {
      return false;
    }
  }
}
