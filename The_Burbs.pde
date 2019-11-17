
//variables to determine which transformations to be applied to each house 
boolean centerLeft = false; 
boolean centerRight = false; 
boolean topCenter = false; 
boolean topLeft = false; 
boolean topRight = false; 
boolean bottomCenter = false; 
boolean bottomLeft = false; 
boolean bottomRight = false; 

void setup() {
  size(640, 640, P3D);  
  colorMode(RGB, 1.0);
  ortho(-1, 1, 1, -1);
  background(255, 255, 255);
  noLoop();
}

void draw() {
  resetMatrix();
  //boundaries 
  drawBoundary();

  //center house 
  drawHouse();

  //center left house  
  centerLeft = true; 
  resetMatrix();
  translate(-0.66f, .0f); 
  drawHouse();
  centerLeft =false; 

  //center right house 
  centerRight = true; 
  resetMatrix();
  translate(0.66f, .0f); 
  drawHouse();
  centerRight = false; 

  //top house 
  topCenter = true; 
  resetMatrix();
  translate(0.0f, .66f); 
  drawHouse();
  topCenter = false; 


  //top left house 
  topLeft = true; 
  resetMatrix();
  translate(-0.66f, .66f); 
  drawHouse();
  topLeft = false; 

  //top right house 
  topRight = true;
  resetMatrix();
  translate(0.66f, .66f); 
  drawHouse();
  topRight= false; 

  //bottom house  
  bottomCenter = true;
  resetMatrix();
  translate(0.0f, -.66f); 
  drawHouse();
  bottomCenter = false; 

  //bottom left house  
  bottomLeft= true;
  resetMatrix();
  translate(-0.66f, -.66f); 
  drawHouse();
  bottomLeft = false; 

  //bottom right house  
  bottomRight = true;
  resetMatrix();
  translate(0.66f, -.66f); 
  drawHouse();
  bottomRight = false; 
}

void drawHouse() {

  if(topLeft){
   rotate(PI/20);
   scale(0.75,0.75);
  }
  if(topCenter) {
    translate(0.1,0.1);
    scale(0.5,0.5);

  }
  if(topRight) {
   rotate(-PI/20);
   scale(0.7,0.7);
  
  }
  if(centerLeft){
    translate(-0.02,0.1);
    rotate(PI);
    
  }
  if(centerRight){
     shearY(-0.2);
     shearX(-0.2);
    
  }
  if(bottomLeft){
    scale(0.8,0.8); 
    translate(-0.1,0);
  }

  if (bottomCenter) {
    scale(1.3,1.3); 
    translate(0.12,0);
  }
  if(bottomRight) {
    scale(0.8,0.8); 
    translate(0.15,0);
  }
  
  drawRoof();
  drawFrontWall();
  drawTree();
}

void drawRoof() {

  pushMatrix();
  translate(-0.15f, 0.1666f);
  drawRoofTop();
  popMatrix();

  pushMatrix();
  translate(-0.15f, 0.1666f);
  drawChimney();
  popMatrix();
}

void drawRoofTop() {
  if (centerLeft)
    rotate(0.2);
  if (topCenter)
    scale(1.2, 1.1);
  if (topRight||bottomLeft)
    rotate(-0.2);
  if (bottomCenter)
    scale(0.5, 0.5);
   if(bottomRight){
    translate(0,-0.45);
    rotate(PI);
    scale(0.6,0.6);
  }
  
  beginShape(TRIANGLES);
  fill(0.1f, 1.5f, 0.6f);
  vertex(0, 0.1f);
  vertex(-0.15, -0.1);
  vertex(0.15, -0.1);
  endShape();
}
void drawChimney() {

  if (topCenter)
    rotate(0.2);  
  if (topLeft)
    translate(0, 0.05);
  if(bottomRight){
    rotate(PI);
  }
  

  final int numBricks = 15 ; 
  float chimneyX = 0; 
  float chimneyY =0.05; 
  
  boolean leftBricks = true; 
  boolean rightBricks = false; 
  for (int i=0; i<=numBricks; i++) {
    pushMatrix();  
    translate(chimneyX, chimneyY); 
    beginShape(QUADS);
    fill(0.5f, 0.3f, 0.15f);
    strokeWeight(2);
    stroke(0);
    vertex(-0.02f, 0.015f);
    vertex(-0.02, -0.015);
    vertex(0.02, -0.015);
    vertex(0.02, 0.015);
    endShape();
    popMatrix();

    if (leftBricks) {
      chimneyX -=0.025; 
      chimneyY -=0.03;
    }

    if (rightBricks) {
      chimneyX +=0.025; 
      chimneyY -=0.03;
    }

    if (i ==4) {
      leftBricks = false; 
      rightBricks = true; 
      chimneyX = 0.02; 
      chimneyY = 0.02;
    }

    if (i ==8) {
      rightBricks = false; 
      leftBricks = true; 
      chimneyX = 0; 
      chimneyY =-0.01;
    }

    if (i ==11) {
      rightBricks = true; 
      leftBricks = false; 
      chimneyX = 0; 
      chimneyY =-0.01;
    }

    if (i == 14) {
      rightBricks = false; 
      chimneyX = 0; 
      chimneyY = -0.07;
    }
  }
}


void drawFrontWall() {

  strokeWeight(1);
  stroke(0);

  pushMatrix();
  translate(-0.15f, -0.1f);
  drawBricks();
  popMatrix();

  pushMatrix();
  translate(-0.15f, -0.1f);
  drawDoor();
  popMatrix();

  strokeWeight(1);
  stroke(0);
  fill(0.7f, 0.5f, 0.1f);
  pushMatrix();

  translate(-0.15f, -0.1f);
  drawWindow();
  popMatrix();
}

void drawBricks() {

  if (centerRight)
    scale(1.4, 1);

  if (topLeft)
    translate(-0.05, 0);

  if (bottomLeft) {
    shearX(-0.2);
    shearY(-0.2);
  }
  float brickX =-0.08; 
  float brickY =0.15; 
  final int numBricks = 45; 

  for (int i=0; i<numBricks; i++) {
    pushMatrix();  
    translate(brickX, brickY); 
    beginShape(QUADS);
    vertex(-0.02f, 0.015f);
    vertex(-0.02, -0.015);
    vertex(0.02, -0.015);
    vertex(0.02, 0.015);
    endShape();
    popMatrix();

    brickX += 0.04;

    if (brickX == 0.12 ) {
      brickY -= 0.03;
      brickX =-0.08;
    }
  }
}

void drawDoor() {

  if (centerLeft||bottomCenter)
    translate(-0.05, 0.1);
  if (centerRight||topRight)
    rotate(-0.3);
  if (topCenter)
    scale(2, 1);

  pushMatrix();  
  translate(0, -0.05); 
  beginShape(QUADS);
  strokeWeight(3);
  fill(0);
  vertex(-0.04f, 0.06f);
  vertex(-0.04, -0.05);
  vertex(0.04, -0.05);
  vertex(0.04, 0.06);
  endShape();
  popMatrix();
}

void drawWindow() {

  if (centerLeft||bottomLeft)
    rotate(-0.3);
  if (centerRight||topLeft)
    scale(1.2, 1.2);
  if (topRight)
    translate(-0.1, 0);
  if (bottomCenter)
    translate(0, -0.15);
  if(bottomRight)
      rotate(0.3);

  pushMatrix();  
  translate(0.05, 0.1); 
  beginShape(QUADS);
  fill(0, 0, 255);
  vertex(-0.04f, 0.04f);
  vertex(-0.04, -0.04);
  vertex(0.04, -0.04);
  vertex(0.04, 0.04);
  endShape();

  stroke(255, 255, 255);
  strokeWeight(3);
  beginShape(LINE_STRIP);
  vertex(-0.04f, 0.0f);
  vertex(0.04f, 0.0f);
  endShape();

  beginShape(LINE_STRIP);
  vertex(0.0f, -0.04f);
  vertex(0.0f, 0.04f);
  endShape();
  
  popMatrix();

  stroke(0);
  strokeWeight(1);
}


void drawTree() {
  
  if (centerLeft)
    translate(0.05, 0.1);
  if (centerRight||topCenter)
    rotate(0.3);
  if (topLeft)
    scale(1.2, 1.5);
  if (topRight)
    translate(-0.05, -0.1);
  if (bottomCenter)
    scale(0.5, 0.5);
  if (bottomLeft) {
    shearX(-0.3);
    shearY(-0.3);
  } 
   if(bottomRight){
    translate(0.2,0);
    rotate(PI);
  }
  
  pushMatrix();
  translate(0.15f, 0f);
  drawLeaves();
  drawTrunk();
  popMatrix();
}

void drawLeaves() {
  beginShape(POLYGON);
  fill(0.2f, 0.8f, 0.1f);
  vertex(0f, 0.2f);
  vertex(-0.1f, 0.1f);
  vertex(-0.02f, 0.1f);
  vertex(-0.1f, 0.0f);
  vertex(0.1f, 0.0f);
  vertex(0.02f, 0.1f);
  vertex(0.1f, 0.1f);
  vertex(0f, 0.2f);
  endShape();
}

void drawTrunk() {

  pushMatrix();
  translate(0.0f, -0.1f);
  beginShape(QUADS);
  fill(0.5f, 0.3f, 0.15f); 
  vertex(-0.05f, 0.1f);
  vertex(-0.05f, -0.1f); 
  vertex(0.05f, -0.1f);
  vertex(0.05f, 0.1f); 
  endShape();
  popMatrix();
}

//draw boundary lines
void drawBoundary() {
  drawBondaryHelper(-.33f, 1.0f, -.33f, -1.0f);
  drawBondaryHelper(.33f, 1.0f, .33f, -1.0f);
  drawBondaryHelper(-1.0f, .33f, 1.0f, .33f);
  drawBondaryHelper(-1.0f, -.33f, 1.0f, -.33f);
}

void drawBondaryHelper(float x1, float y1, float x2, float y2) {
  float x, y;

  beginShape(LINES);
  for (float t = 0.0f; t <= 1.0f; t += 0.001) {
    x = x1 - x1 * t + x2 * t;
    y = y1 - y1 * t + y2 * t;
    vertex(x, y);
  }
  endShape();
}
