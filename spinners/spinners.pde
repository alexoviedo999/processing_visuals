/*
 * Based on of Indae Hwang and Jon McCormack's sketches from Monash University //<>//
 */
 
int frames = 20;
int framesToSave = 0;

void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
}


void draw() {
  background(180);
  noStroke();

  int num = 20;  // the number of rows and columns
  int margin = 40; // margin between the edges of the screen and the circles

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / num; // size of each circle

  int circleNumber = 10; // counter

  for (int i=0; i<num; i++) { // column in y
    for (int j=0; j<num; j++) { // row in x
      ++circleNumber;
      fill(140 + i *5, 180 + j*5);
      stroke(200);
      strokeWeight(3);
      float tx = margin + cellsize/2  + (cellsize + gutter) * j;
      float ty = margin + cellsize/2  + (cellsize + gutter) * i;

      movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 50000.0);
    }
  }
   //for making gif
  if (framesToSave > 0) {
    saveFrame("loop####.gif");
    framesToSave--;
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * cos(angle);
  float tempY = y + (size / 2) * sin(angle);

  
  ellipse(x, y, size, size); // circle

  stroke(200, 0, 0);
  line(x, y, tempX, tempY); // red line
}

void keyPressed() {
  if (key == 's') {
    framesToSave = frames;
  }
}