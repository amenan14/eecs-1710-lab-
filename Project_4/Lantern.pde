class Lantern {
 // code inspired by the video by Coding train regarding how to animate an image
float x;
float y;
float diameter;

Lantern(float tempX, float tempY, float tempD) {
  x= tempX;
  y=tempY;
  diameter= tempD;
}

void ascend() {
  y--;
  x= x + random(-2,2);
}

void display() {
  
  imageMode(CORNER);
  image(lantern,x,y,diameter,diameter);
}

void top() {
  if(y < diameter/2) {
    y = diameter/2;
  }
}
}
