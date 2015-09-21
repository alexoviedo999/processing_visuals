
/*
 * Based on of Indae Hwang and Jon McCormack's sketches from Monash University
 */
 
int frames = 20;
int framesToSave = 0;

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(5);  // set the frame rate to 1 draw() call per second
}


void draw() { 
  background(180); // clear the screen to grey
  int num = (int) 5;   // select a random number of squares each frame //<>//
  
  for (int i=0; i<num; i++) { //<>//
    for (int j=0; j<num; j++) {
      int gap = (int) random(1, 50); // select a random gap between each square
      // calculate the size of each square for the given number of squares and gap between them
      float cellsize = ( width - (num + i) * gap ) / (float)num + j;
       // calculate shadow offset
      float offsetX = cellsize/16.0 * i;
      float offsetY = cellsize/16.0 * j;

      fill(140, 180); // shadow
      rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

      fill(247, 57+(i*15), 57+(i*5), 180); // rectangle
      rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize); //<>// //<>//
    }
  }
  //for making gif
  if (framesToSave > 0) {
    saveFrame("loop####.gif");
    framesToSave--;
  }
} //end of draw

void keyPressed() {
  if (key == 's') {
    framesToSave = frames;
  }
}