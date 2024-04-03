class Piece {
  
  float sticker_explode = 1.5;
  //1.34 seems to set it to exactly on the boxes

  Matrix orientation = new Matrix(1, 0, 0,
    0, 1, 0,
    0, 0, 1);
  PVector position = new PVector();

  // constructor of a piece
  Piece(PVector p) {
    position = p;
  }


  void move(String s) {
    Matrix m = new Matrix();
    if (s.equals("x")) {
      m = new Matrix(1, 0, 0,
                     0, 0, 1,
                     0, -1, 0);
    }
    if (s.equals("xp")) {
      m = new Matrix(1, 0, 0,
                     0, 0, -1,
                     0, 1, 0);
    }
    if (s.equals("y")) {
      m = new Matrix(0, 0, -1,
                     0, 1, 0,
                     1, 0, 0);
    }
    if (s.equals("yp")) {
      m = new Matrix(0, 0, 1,
                     0, 1, 0,
                     -1, 0, 0);
    }
    if (s.equals("z")) {
      m = new Matrix(0, 1, 0,
                     -1, 0, 0,
                     0, 0, 1);
    }
    if (s.equals("zp")) {
      m = new Matrix(0, -1, 0,
                     1, 0, 0,
                     0, 0, 1);
    }
    
    orientation = m.multiply(orientation);
  }
  
  PVector getPos() {
    return orientation.multiply(position);
    
  }
  
  void drawSticker(PVector p, int a, Matrix o) {
    // p is the (center of the) piece
    PVector sticker_center = new PVector(p.x, p.y, p.z);
    PVector u = new PVector(0, 0, 50);
    PVector v = new PVector(0, 50, 0);
    
    // u and v are helper vectors within the sticker like unit vectors.
    if (a==0) {
      sticker_center.x *= sticker_explode;
    }
    if (a==1) {
      sticker_center.y *= sticker_explode;
      u = new PVector(0, 0, 50);
      v = new PVector(50, 0, 0);
    }
    if (a==2) {
      sticker_center.z *= sticker_explode;
      u = new PVector(50, 0, 0);
      v = new PVector(0, 50, 0);
    }
    
    u = o.multiply(u);
    v = o.multiply(v);
    
    sticker_center = o.multiply(sticker_center);
    
    pushMatrix();
    translate(150*sticker_center.x, -150*sticker_center.y, 150*sticker_center.z);
    beginShape();
    vectorVertex(PVector.add(u,v));
    vectorVertex(PVector.add(u,PVector.mult(v,-1)));
    vectorVertex(PVector.add(PVector.mult(u,-1),PVector.mult(v,-1)));
    vectorVertex(PVector.add(PVector.mult(u,-1),v));
    endShape(CLOSE);
    popMatrix();
  }
  
  void vectorVertex(PVector v) {
    vertex(v.x, v.y, v.z);
}
  

  void draw() {
    //put the coordinate system at the center of the screen
    pushMatrix();
    
    // translates to the center of the PIECE
    pushMatrix();
    translate(150*position.x, 150*position.y, 150*position.z);
    fill(128,128,128);
    // put a little box at the center of the piece
    box(100, 100, 100);
    popMatrix();




    // draw x sticker of piece
    if (position.x != 0) {
      if (position.x == 1) fill(255, 0, 0); // red
      if (position.x == -1) fill(255, 128, 0); // orange
      drawSticker(position, 0, orientation);
    }

    // draw z sticker of piece
    if (position.z != 0) {
      if (position.z == 1) fill(0, 255, 0); // green
      if (position.z == -1) fill(0, 0, 255); // blue
      drawSticker(position, 2, orientation);
      
    }

    // draw y sticker of piece
    if (position.y != 0) {
      if (position.y == 1) fill(255, 255, 255); // white
      if (position.y == -1) fill(255, 255, 0); // yellow
      drawSticker(position, 1, orientation);
      
    }
    
    popMatrix();
  }

  void printPosition() {
    position = orientation.multiply(position);
    print("\nx: " + position.x + " y: " + position.y + " z: " + position.z);
  }
}
