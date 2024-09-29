float currentShape; // 도형의 모양 저장 
float shapeSize = random(8, 12);
float x1, y1, x2, y2, r, g, b;
float numLines = 24;
float alpha = random(38,95);

void setup() {
  size(1280, 720);
  currentShape = int(random(0, 3)); // 시작할 때 랜덤한 모양 
  frameRate(1.75);  // 초 늘리기 
}

void draw() {
  background(0); 
  
  for (int i = 0; i < numLines; i++) {
    x1 = random(-100, width + 200); //100px전에서 시작 끝후 200px더하기 
    y1 = random(-100, height + 200);
    x2 = random(-100, width + 200);
    y2 = random(-100, height + 200);
  
    r = random(255);
    g = random(225);
    b = (225);
  
  stroke(r, g, b);
  strokeWeight(random(1, 5));
  line(x1, y1,  x2, y2);
  }
  
  drawShapes();
  
  currentShape = int(random(0, 3));// 도형 랜덤을 바뀌도록 설정 
}

//랜덤한 도형함수 만들기 
void drawShapes() {
  noStroke();
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      float x = i * 20; // 0시작 가로 20px 씩 띄움 
      float y = j * 20; // 0시작 세로로 20px 씩 띄움
      
      
      //fill(random(255));
      fill(random(255), random(255), 255, alpha);
      //fill(random(255), 255, random(255));
      
      // currentShape에 따라 도형 그리기
      if (currentShape == 0) {
        // 동그라미 
        ellipse(x, y, shapeSize, shapeSize);
      } else if (currentShape == 1) {
        // 네모 
        rect(x - shapeSize / 2, y - shapeSize / 2, shapeSize, shapeSize);
      } else if (currentShape == 2) {
        // 세모 
        triangle(x - shapeSize / 2, y + shapeSize / 2, x + shapeSize / 2, y + shapeSize / 2, x, y - shapeSize / 2);
      }
    }
  }
}


