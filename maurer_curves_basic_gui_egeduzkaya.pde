import controlP5.*;
import processing.pdf.*;
boolean record;

ControlP5 cp5;

float r = 250;
float petalLen;
int resolution = 100;
float theta;
float x;
float y;
float k;
float n = 10;
float d = 90;
float c = 0;

int index = 0;
float animationVal1;

void setup() {
  
  size(600, 600);

  cp5 = new ControlP5(this);

 
  cp5.addSlider("n")
     .setPosition(125,570)
     .setLabel("n Value")
     .setWidth(400)
     .setRange(0,50)
     .setValue(128)
     .setNumberOfTickMarks(51)
     .setSliderMode(Slider.FLEXIBLE)
     ;

  cp5.addSlider("resolution")
     .setPosition(30,470)
     .setLabel("Number of Points")
     .setSize(20,100)
     .setRange(20, 360*2)
     .setNumberOfTickMarks(5)
     ;


  cp5.addSlider("r")
    .setLabel("Radius")
    .setPosition(15, 12)
    .setRange(20, 300)
    ;

  cp5.addSlider("d")
    .setLabel("d Value")
    .setPosition(170, 12)
    .setRange(0, 100)
    .setNumberOfTickMarks(51);
}


void draw() {
  
  animationVal1 = d;
  
  background(0);
  pushMatrix();
  translate(width*0.5, height*0.5);
  noFill();
  stroke(255);

  k = n / d;

  beginShape();
  for (int i = 0; i < resolution; i++) {

    theta = map(i*ceil(animationVal1), 0, resolution, 0, TWO_PI);
   
    petalLen = sin(n*theta);

    x = r * petalLen * sin(theta);
    y = r * petalLen * cos(theta);

    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();

}
