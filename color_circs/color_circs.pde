/*
 * Based on of Indae Hwang and Jon McCormack's sketches from Monash University
 */

int frames = 20;
int framesToSave = 0;
int frame_rate_value;

void setup() {
  size(500, 500);
  frame_rate_value = 20;
  rectMode(CENTER);
  background(random(250));
}


void draw() {
  int num = 15;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) )/10 ;

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j;
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
  //for making gif
  if (framesToSave > 0) {
    saveFrame("loop####.gif");
    framesToSave--;
  }
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {
  float circlePeriod = (float)frame_rate_value * 2;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;
  float circleSize = size * 1.0 * sin(circleAge * HALF_PI);

  strokeWeight(5);
  stroke(255, lerp(255, 0, circleAge), lerp(100, 0, circleAge), 100);
  fill(lerp(128, 0, circleAge), lerp(120, 0, circleAge), 100, 100);
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
}

void keyPressed() {
  if (key == 's') {
    framesToSave = frames;
  }
}