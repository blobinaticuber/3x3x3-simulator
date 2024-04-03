// Rowan's first actually good 3x3x3 simulator
// Each piece has a vector and an array, and linear alg is done to render and compute things

Piece[][][] pieces = makePuzzle();
// a 3x3x3 array of pieces (the whole puzzle)
// this array never gets moved or twisted around.
// the pieces inside get their location changed with their matrix and vector

void setup() {
  size(800, 800, P3D);
  surface.setLocation(100,100);
  background(0);

  //pieces[2][2][1].printPosition();
  //pieces[2][2][1].moveX();
  //pieces[2][2][1].printPosition();
  // piece 2,2,1 because its 0-indexed is like 1,1,0 (UR edge)

  // Hactar wants me to have this a 1D array
  // pros: i wouldnt have to do a triple for loop?
}



Piece[][][] makePuzzle() {

  Piece[][][] pieces = new Piece[3][3][3];
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      for (int k = -1; k < 2; k++) {
        pieces[i+1][j+1][k+1] = new Piece(new PVector(i, j, k));
      }
    }
  }
  return pieces;
}

float camX = 0.0;
float camY = 0.0;

float dx;
float dy;



void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2); 
  rotateX(camX);
  rotateY(camY);
  
  if (mousePressed) {
    camX += dy/100.0;
    camY += dx/100.0;
  } 
  

    

  
  
  
  // for all of the pieces, draw them
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        pieces[i][j][k].draw();
      }
    }
  }
  popMatrix();

  
}

void mouseDragged() {
  dy = -1*(mouseY-pmouseY);
  dx = mouseX-pmouseX;
}

void keyPressed() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        // get the vector of the position of the current piece
        PVector pv = pieces[i][j][k].getPos();
        //RUF twists
        if (key == 'u' && pv.x == 1) pieces[i][j][k].move("x");
        if (key == 'e' && pv.x == 1) pieces[i][j][k].move("xp");
        if (key == 'n' && pv.y == 1) pieces[i][j][k].move("y");
        if (key == 'i' && pv.y == 1) pieces[i][j][k].move("yp");
        if (key == 'y' && pv.z == 1) pieces[i][j][k].move("z");
        if (key == 'l' && pv.z == 1) pieces[i][j][k].move("zp");
        // xyz rotations
        if (key == 'h') pieces[i][j][k].move("x");
        if (key == 'd') pieces[i][j][k].move("xp");
        if (key == 'a') pieces[i][j][k].move("y");
        if (key == 'o') pieces[i][j][k].move("yp");
        if (key == ';') pieces[i][j][k].move("z");
        if (key == 'q') pieces[i][j][k].move("zp");
      }
    }
  }
}
