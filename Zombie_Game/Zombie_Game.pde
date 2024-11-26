import java.util.ArrayList;

//Array of animation images
PImage zombieAnimationImages[] = new PImage[3];
PImage vampireAnimationImages[] = new PImage[1];
PImage backgroundImage1;
PImage backgroundImage2;
//Arrays of enemy objects
ArrayList<Zombie> zombies = new ArrayList();
ArrayList<Vampire> vampires = new ArrayList();
ArrayList<Zombie> zombies2 = new ArrayList();
ArrayList<Vampire> vampires2 = new ArrayList();
PImage startScreenLogo;
Survivor survivor1;
int frameCounter = 0; //Framecounter
int bgX = 0; // background x position
int lives = 10;
int numEnemies = 10;
int numEnemies2 = 20;
int numEnemies3 = 25;
int score = 0;
int mouse_x;
int mouse_y;
int level = 1;
boolean hasCollided = false;
boolean start_screen = true;
boolean GamePLaying = false;
boolean GamePlaying2 = false;
boolean endScreen = false;
boolean winScreen = false;
boolean LevelTransition = false;
boolean LevelTransition2 = false;



void setup() {
  size(700, 400);
  backgroundImage1 = loadImage("BackgroundImage.jpeg");
  backgroundImage1.resize(width, height);
  backgroundImage2 = loadImage("BackgroundImage2.jpeg");
  backgroundImage2.resize(width, height);
  zombieAnimationImages[0] = loadImage("ZombieFrame1.jpeg");
  zombieAnimationImages[1] = loadImage("ZombieFrame2.jpeg");
  zombieAnimationImages[2] = loadImage("ZombieFrame3.jpeg");
  startScreenLogo = loadImage("startScreenLogo.jpeg");
  startScreenLogo.resize(200, 200);
  vampireAnimationImages[0] = loadImage("vampireFrame1.jpeg");
  //Array of enemies level one
  for (int a = 0; a < numEnemies; a++) {
    zombies.add(new Zombie(random(0, -10000), random(6), zombieAnimationImages));
    vampires.add(new Vampire(random(400), random(6), random(6), vampireAnimationImages));
  }
  //Array list of enemies level 2
  for (int i = 0; i < numEnemies2; i++) {
    zombies2.add(new Zombie(random(0, -10000), random(6), zombieAnimationImages));
    vampires2.add(new Vampire(random(400), random(6), random(6), vampireAnimationImages));
  }
  survivor1 = new Survivor();
}


void draw() {
  frameCounter += 1;
  if (frameCounter == 60) {
    frameCounter = 0;
  }
  if (start_screen == true) {
    start_screen();
  }
  if (GamePLaying == true) {
    GamePlaying();
  }
  if (GamePlaying2 == true) {
    GamePlaying2();
  }
  if (LevelTransition == true) {
    levelTransistion();
  }
  if (endScreen == true) {
    endscreen();
  }
  if (winScreen == true) {
    winScreen();
  }
}

//Draw and animate background function
void drawBackground(PImage bImage) {
  image(bImage, bgX, 0);
  image(bImage, bgX+bImage.width, 0);
  bgX = bgX - 4;
  if (bgX == -bImage.width) {
    bgX = 0;
  }
}

void start_screen() {
  background(0);
  textSize(40);
  text("Zombie Bombers", 210, 200);
  textSize(20);
  text("PLAY", 320, 250);
  textSize(10);
  text("V1.0", 670, 390);

  if (mouseX - 320 < 50 && mouseY - 250 < 20) {
    fill(255, 255, 0);
    textSize(20);
    text("PLAY", 320, 250);
    fill(255, 255, 255);
  }

  frameCounter += 1;
  if (frameCounter == 60) {
    frameCounter = 0;
  }
  if (frameCounter < 31) {
    image(startScreenLogo, 0, 150);
    image(startScreenLogo, 725-startScreenLogo.width, 150);
  }
  if (frameCounter< 20) {
    image(zombieAnimationImages[0], 300, 50);
  } else if (frameCounter < 40) {
    image(zombieAnimationImages[1], 300, 50);
  } else {
    image(zombieAnimationImages[2], 300, 50);
  }
}

//Function for detecting whether the play button has been clicked on the start screen
void mouseClicked() {
  if (mouseX - 320 < 10 && mouseY - 250 < 10 && mouseX > 0 && mouseY > 0) {
    start_screen = false;
    GamePLaying = true;
  }
  mouse_x = mouseX;
  mouse_y = mouseY;
}

void endscreen() {
  background(0);
  textSize(60);
  if (frameCounter < 30) {
    fill(255, 0, 0);
    text("Game Over", 225, 175);
  } else {
    fill(255, 255, 255);
    text("Game Over", 225, 175);
  }
  if (abs(mouseX - 305) < 150 && abs(mouseY - 300) <50) {
    fill(255, 255, 0);
    textSize(30);
    text("new game", 305, 300);
    if (mousePressed) {
      endScreen = false;
      start_screen = true;
    }
  } else {
    fill(255, 255, 255);
    textSize(30);
    text("new game", 305, 300);
  }
}
void score() {
  fill(255, 255, 0);
  text("Score:" + score, 600, 20);
}

void GamePlaying() {
  drawBackground(backgroundImage1);
  score();
  survivor1.Animate();
  renderZombies(zombies);
  renderVampires(vampires);
  enemiesDead();
  displayLevel();
  displayLives();
  gameOver();
}

void GamePlaying2() {
  textSize(20);
  lives = 5;
  level = 2;
  tint(0, 153, 204);
  drawBackground(backgroundImage1);
  tint(255, 255, 225);
  score();
  survivor1.Animate();
  renderZombies(zombies2);
  renderVampires(vampires2);
  enemiesDead2();
  displayLevel();
  displayLives();
  gameOver();
}



void displayLevel() {
  fill(255, 255, 255);
  text("Level: " + level, 25, 25);
}

void displayLives() {
  fill(255, 0, 0);
  text("Lives: " + lives, 325, 25);
}

void renderZombies(ArrayList<Zombie> zombs) {
  for (int i = 0; i<zombs.size(); i++) {
    Zombie z = zombs.get(i);
    z.render();
    z.collisionSurvivor();
    if (z.mouseCollisionDetection(mouseX, mouseY)) {
      zombs.remove(z);
      score += 100;
    }
  }
}

void renderVampires(ArrayList<Vampire> vamps) {
  for (int i = 0; i<vamps.size(); i++) {
    Vampire v = vamps.get(i);
    v.render();
    v.collisionSurvivor();
    if (v.mouseCollisionDetection(mouseX, mouseY)) {
      vamps.remove(v);
      score+=50;
    }
  }
}

//function checks to see if all enemies are dead
void enemiesDead() {
  if (vampires.size() == 0 && zombies.size() == 0) {
    GamePLaying = false;
    LevelTransition = true;
  }
}

void enemiesDead2() {
  if (vampires2.size() == 0 && zombies2.size() == 0) {
    GamePlaying2 = false;
    winScreen = true;
  }
}

void levelTransistion() {
  background(0);
  if (frameCounter < 30) {
    textSize(40);
    fill(255, 255, 255);
    text("Level " + level + " complete!", 200, 150);
  } else {
    textSize(40);
    fill(212, 175, 55);
    text("Level " + level + " complete!", 200, 150);
  }
  fill(255, 255, 255);
  textSize(30);
  text("Score: " + score, 270, 190);
  textSize(40);
  if (abs(mouseX - 255) < 200 && abs(mouseY - 250) < 50) {
    fill(255, 255, 0);
    text("Next Level", 255, 250);
  } else {
    fill(255, 255, 255);
    text("Next Level", 255, 250);
  }
  if (abs(mouseX - 255) < 200 && abs(mouseY - 250) < 50 && mousePressed ) {
    LevelTransition = false;
    GamePlaying2 = true;
  }
}

void gameOver() {
  if (lives == 0) {
    GamePLaying = false;
    endScreen = true;
    lives = 10;
    for (Zombie zombie : zombies) {
      zombie.x = -100;
    }
  }
}

void winScreen() {
  background(0);
  textSize(60);
  if (frameCounter < 30) {
    fill(212, 175, 55);
    text("You WIN!", 225, 175);
  } else {
    fill(255, 255, 255);
    text("You WIN!", 225, 175);
  }
  if (abs(mouseX - 305) < 150 && abs(mouseY - 300) <50) {
    fill(255, 255, 0);
    textSize(30);
    text("new game", 305, 300);
  } else {
    fill(255, 255, 255);
    textSize(30);
    text("new game", 305, 300);
  }
  if (abs(mouseX - 305) < 150 && abs(mouseY - 300) <50 && mousePressed) {
    winScreen = false;
    start_screen = true;
  }
}
