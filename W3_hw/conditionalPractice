float y1, y2, y3, y4;       
float maxShapeWidth, maxShapeHeight; 
float lineSize, circleSize, rectSize;  // 도형 크기 변수
float rectWidth, rectHeight; // 직사각형 변수 

void setup() {
  size(640, 360);
  rectMode(CENTER);

 
  y1 = height / 8;     // 첫 번째  중앙
  y2 = height * 3 / 8; // 두 번째  중앙
  y3 = height * 5 / 8; // 세 번째  중앙
  y4 = height * 7 / 8; // 네 번째  중앙

  
  maxShapeWidth = width / 4 - 20;  // 너비 제한
  maxShapeHeight = height / 4 - 20; // 높이 제한
}

void draw() {
  background(0);

  // 가로선 그리기
  stroke(127);
  strokeWeight(4);
  line(0, height / 4, width, height / 4);   // 첫 번째 
  line(0, height / 2, width, height / 2);   // 두 번째 
  line(0, height * 3 / 4, width, height * 3 / 4); // 세 번째 

  
  if (mouseY < height / 4) { // 대각선 
    lineSize = min(100, maxShapeHeight);   
    line(width * 0.5 + lineSize / 2, y1 - lineSize / 2, 
    width * 0.5 - lineSize / 2, y1 + lineSize / 2);
    
  } else if (mouseY < height / 2) { //정사각형 
    rectSize = min(100, maxShapeHeight); 
    rect(width * 0.5, y2, rectSize, rectSize); 
  } else if (mouseY < height * 3 / 4) { // 직사각형 
    rectWidth = min(170, maxShapeWidth);  
    rectHeight = min(43, maxShapeHeight);
    rect(width * 0.5, y3, rectWidth, rectHeight, 5);  
    
  } else { // 원
    circleSize = min(100, maxShapeHeight); 
    circle(width * 0.5, y4, circleSize);
  }
}
