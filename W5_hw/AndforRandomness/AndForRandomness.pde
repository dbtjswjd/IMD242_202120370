float tileW, tileH;
int tileNum;
int randomSeed = 0;
float noiseMult = 0.015;

float xoff = 0;

void setup() {
  size(800, 800);
  background(0);
  frameRate(20);
}

void draw(){
  randomSeed(randomSeed);
  background(0);
  
  tileNum = int(map(mouseX, 0, width ,3, 16 +1));
  float tileSize = width / float(tileNum);
  
  noiseMult = pow(10, map(mouseY, 0, height,0.1,-10));
  //noiseMult =map(mouseY, 0, height, 0.001, 0.1);
  
  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;
      
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult + xoff );
      
      noFill();
      stroke(255);
      circle(centerX, centerY, tileSize);
      
      pushMatrix();
      translate(centerX, centerY);
      
      
      rotate(radians(-90 + 180 * noiseVal));
      
      //rotate(radians(360 * noiseVal));
      
      //float randomVal = random(1);
      //rotate(radians(30 * randomVal));
      
      line(0, 0, tileSize *0.8 * 0.5, 0);
      
      noStroke();
      fill(255);
      circle(tileSize * 0.4, 0, tileSize * 0.2);
      popMatrix();
      
      xoff += 0.01;
      

  }
  }

}