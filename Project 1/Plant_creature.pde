int numPlants = 3;
int numFoods = 3;

Plant[] plants = new Plant[numPlants];
Food[] foods = new Food[numFoods];

void setup() { 
  size(800, 600, P2D);
  
  for(int i=0; i< slides.length;i++){
    slides[i]= loadImage(slideUrls[i]);
  }
  
  for (int i=0; i<plants.length; i++) {
    plants[i] = new Plant(random(width), random(height));
  }
  
  for (int i=0; i<foods.length; i++) {
    foods[i] = new Food(random(width), random(height));
  }
}

void draw() {
  background(127);

  image(slides[slideCounter],0,0);
  
  
  for (int i=0; i<foods.length; i++) {
    foods[i].run();
  }
  
  for (int i=0; i<plants.length; i++) {
    plants[i].run();
  }
}
