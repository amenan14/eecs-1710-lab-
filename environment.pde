String[] slideUrls = {"project_background.jpg","forest.night.jpg"};
PImage[] slides= new PImage [ slideUrls.length];
int slideCounter = 0;



void keyPressed() {
  if (key == ' ') {
    slideCounter++;
    if ( slideCounter > slides.length-1) slideCounter=0;
  }else if ( key == 'z') {
    slideCounter --;
    if (slideCounter < 0) slideCounter = slides.length-1;
  }
}
