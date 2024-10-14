//float cneterX, centerY;
float circleX, circleY;


void setup() {
  size(800, 800);
}


void draw() {
  background(0);

  float clockS = 250 * 0.85;
  float clockS2 = 250 * - 0.1;
  float clockM = 250 * 0.8;
  float clockH = 250 * 0.65;

  float circleX = width * .5;
  float circleY = height * .5;

  noStroke();
  fill(255);
  circle(circleX, circleY, 500);
  pushMatrix();
  translate(circleX, circleY);

  float S = map(second(), 0, 60, 0, TWO_PI)-HALF_PI;
  float M = map(minute()+ norm(second(), 0, 60), 0, 60, 0, TWO_PI)-HALF_PI;
  float H = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2)-HALF_PI;

  stroke(255, 0, 0);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(0, 0, cos(S) * clockS, sin(S)* clockS);
  
  stroke(255, 0, 0);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(0, 0, cos(S) * clockS2, sin(S)* clockS2);

  stroke(0);
  strokeWeight(4);
  strokeCap(SQUARE);
  line(0, 0, cos(M) * clockM, sin(M) * clockM );

  stroke(50);
  strokeWeight(4.5);
  strokeCap(SQUARE);
  line(0, 0, cos(H) * clockH, sin(H) * clockH);


  for (int hourL = 0; hourL < 360; hourL +=30) {
    rotate(radians(30));
    stroke(0);
    strokeWeight(3);
    line(250, 0, 250 * 0.9, 0);
  }

  for (int minuteL = 0; minuteL < 360; minuteL += 6) {
    rotate(radians(6));
    stroke(0);
    strokeWeight(1);
    line(250, 0, 250 * 0.97, 0 );
  }
  
  noStroke();
  fill(255, 0, 0);
  circle(0, 0, 20);



  popMatrix();
}