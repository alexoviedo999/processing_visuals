/*
 * Based on of Indae Hwang and Jon McCormack's sketches from Monash University
 */

int frames = 20;
int framesToSave = 0;
// variable used to store the current frame rate value
int frame_rate_value;

void setup() {
  size(500, 500);
  frame_rate_value = 10;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  ellipseMode(CENTER);
  background(255);
}


void draw() {
  background(180); //<>//
  int num = 20;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 15; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04
      fill(180 + i *1, 180 + j);
      stroke(100 + i);
      strokeWeight(2);
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      movingCircle(tx, ty, cellsize, circleNumber/20);
    }
  }
  //for making gif
  if (framesToSave > 0) {
    saveFrame("loop####.gif");
    framesToSave--;
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;   //<>//
  float tempX = x + (size / 1.5) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 1.5) * cos(PI / frame_rate_value * finalAngle);

  ellipse(x, y, size, size); // circle
  fill(200);
  rect(tempX, tempY, size, size);
  stroke(200, 0, 0);
  line(x, y, tempX, tempY);
}


void keyPressed() {
  if (key == 's') {
    framesToSave = frames;
  }
}