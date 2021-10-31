class Plant {

  boolean debug = false;
  PVector position, target, mousePos;
  PImage plantCurrent, plant01, plant02, plant03, plant04;
  float margin = 50;
  int foodChoice;
  
  
  boolean isBothered = false;
  int botheredMarkTime = 0;
  int botheredTimeout = 1000; 
  float botheredSpread = 5;
  
  boolean isBlinking = false;
  int blinkMarkTime = 0;
  int blinkTimeout = 4000;
  int blinkDuration = 250;
  
  boolean isHunting = false;
  
  float triggerDistance1 = 100;
  float triggerDistance2 = 25;
  float movementSpeed = 0.08;
      
  
  Plant(float x, float y) {    
    position = new PVector(x, y);
  
    pickEscapeTarget();
    
    plant01 = loadImage("plant creature smiling.png");
    plant01.resize(plant01.width/3, plant01.height/3);
    plant02 = loadImage("plant creature eyes close.png");
    plant02.resize(plant01.width, plant01.height);
    plant03 = loadImage("plant creature-sleeping.png");
    plant03.resize(plant01.width, plant01.height);
    plant04 = loadImage("plant creature neutral.png");
    plant04.resize(plant01.width, plant01.height);
    
    plantCurrent = plant01;    
  }
  
  void update() {
    int t = millis();
    
    mousePos = new PVector(mouseX, mouseY);
    
    isBothered = position.dist(mousePos) < triggerDistance1;
    
    if (isBothered) {
      isHunting = false;
      botheredMarkTime = t;
      plantCurrent = plant04; 
      if (position.dist(target) < triggerDistance2) {
        pickEscapeTarget();
      }
    } else if (!isBothered && t > botheredMarkTime + botheredTimeout) {
      if (!isBlinking && t > blinkMarkTime + blinkTimeout) {
        isBlinking = true;
        blinkMarkTime = t;
      } else if (isBlinking && t > blinkMarkTime + blinkDuration) {
        isBlinking = false;
      }
  
      if (isBlinking) {
        plantCurrent = plant02; 
      } else {
        plantCurrent = plant01; // happy expression
      }   
      
      
      if (!isHunting) {
        pickFoodTarget();
        isHunting = true;
      }
    } else if (!isBothered && t > botheredMarkTime + botheredTimeout/6) {
      plantCurrent = plant04; // neutral expression
    }
  
    if (isBothered || isHunting) {
      position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
    }
    
    if (isHunting && position.dist(target) < 5) {
      foods[foodChoice].alive = false; 
      pickFoodTarget();
    }
    
    position.y += sin(t) / 2;
  }
  
  void draw() {    
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
  
    pushMatrix();
    translate(position.x, position.y);
    image(plantCurrent, 0, 0);

    if (!isBlinking && !isBothered) {
     
    }
    popMatrix();
  
    if (debug) {
      noFill();
      stroke(0, 255, 0);
      ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
      ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
      line(target.x, target.y, position.x, position.y);
      stroke(255, 0, 0);
      rect(target.x, target.y, 10, 10);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
  void pickEscapeTarget() {
    target = new PVector(random(margin, width-margin), random(margin, height-margin));
  }
  
  void pickFoodTarget() {
    foodChoice = int(random(foods.length));
    if (foods[foodChoice].alive) {
      target = foods[foodChoice].position;
    }
  }
  
}
