class LetterGenerator {
  
  PShape b,c,d;
  ArrayList<Letter> letters;
  PVector position;
  float offset= 130;
  
  LetterGenerator(String input,float x, float y) {
    initShapes();
    position = new PVector(x,y);
    letters = new ArrayList<Letter>();
    
    for ( int i=0; i<input.length(); i++) {
      char ch = input.charAt(i);
      
      float px= position.x + ((i+1) * offset);
      float py = position.y;
      
      switch(ch) {
        case'b':
        letters.add(new Letter(b, px, py));
        break;
        case'c':
        letters.add(new Letter(c,px,py));
        break;
        case'd':
        letters.add(new Letter(d,px,py));
        break;
      }
    }
    
  }
  
  void initShapes() {
     b = createShape();
    b.beginShape();
    b.translate(170, 10);
    b.fill(255,0,0);
    b.vertex(4, -3);
    b.fill(0, 255,0);
    b.vertex(-175, 353);
    b.stroke(225);
    b.vertex(-43, 220);
    b.vertex(57, 219);
    b.vertex(177, 358);
    b.beginContour();
    b.vertex(-40,180);
    b.vertex(0, 60);
    b.vertex(40,180);
    b.endContour();
    b.endShape(CLOSE);
    
    c = createShape();
    c.beginShape();
    c.translate(50, 10);
    c.texture(katana);
    c.vertex(0, 0, 0, 0);
    c.vertex(-11, 313, -11, 313);
    c.vertex(202, 230, 202, 230);
    c.vertex(59, 145, 59, 145);
    c.vertex(204, 24, 204, 24);
    c.beginContour();
    c.vertex(40, 120, 40,120);
    c.vertex(40, 30, 40, 30);
    c.vertex(120, 50, 120, 50);
    c.endContour();
    c.beginContour();
    c.vertex(30, 260, 30, 260);
    c.vertex(30, 180, 30, 180);
    c.vertex(110, 230, 110, 230);
    c.endContour();
    c.endShape(CLOSE);   
    
    d = createShape();
    d.beginShape();
    d.texture(katana);
    // normalized UVs are more confusing to work with in Processing,
    // but are more standard in other 3D apps
    d.textureMode(NORMAL);
    d.translate(220, 0);
    d.vertex(0.0, 0.0, 0, 0);
    d.vertex(-177, -7, 0, 1);
    d.vertex(-168, 282, 1, 1);
    d.vertex(51, 269, 0, 1);
    d.vertex(-127, 246, 1, 0);
    d.vertex(-146, 21, 0, 0);
    d.endShape(CLOSE);
  }
  
  void update() {
    //
  }
  
  void draw() {
    for (Letter letter : letters) {
      letter.run();
    }
  }
  
  void run() {
    update();
    draw();
  }

}
    
        
