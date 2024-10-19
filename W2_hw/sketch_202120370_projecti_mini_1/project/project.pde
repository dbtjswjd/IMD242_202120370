// point(640/2 , 480/2);//했을떄 가운데에찍히지 않음 왜그런지 다시 공부해보기 이해필요)
//point(320 , 240);// 가운데 점찍고 싶으면 나누기해서 입력해주어야함ellipse(mouseX-110, mouseY-50, 30, 30);
Bubble[] bubbles = new Bubble[25];// 배경에 물방울 추가
int squidColor;  // 오징어 색상을 저장할 전역 변수로 int 사용
int patternColor;

float eyeOffset = 0.6; // 눈의 이동 거리
float eyeDirection = 0.6; // 이동 방향: 1은 오른쪽, -1은 왼쪽
float leftEyeX, rightEyeX; // 눈의 x 위치
float originalLeftEyeX, originalRightEyeX; // 원래 위치 저장
boolean shouldMoveEyes = true; // 눈이 움직여야 하는지 여부
int delayTime = 500; // 클릭 후 지연 시간 (밀리초)
int lastClickTime = 0; // 마지막 클릭 시간


void setup(){
  size(800, 600);
  background(7, 30, 92);
  squidColor = color(246, 236, 210); 
  patternColor = color(232, 217, 178);//오징어와 오징어 무늬의 기본컬러 
  
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble(); // 각 버블을 초기화 (X 좌표는 랜덤)
  }
  
   
  // 눈의 초기 위치 설정
  leftEyeX = 364; 
  rightEyeX = 411; 
  originalLeftEyeX = leftEyeX; // 원래 위치 저장
  originalRightEyeX = rightEyeX; // 원래 위치 저장
}


void draw() {
  background(7, 30, 92);  
   for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].ascend();   // 버블의 위치를 갱신
    bubbles[i].display();  // 버블을 화면에 표시
  }
  
  pushMatrix();
  
//translate(175,100);//오징어를 전체적으로 가운데에 두기 
  translate(mouseX - 263, mouseY - 75); //마우스에 오징어 위치를 맞추기 
scale(0.68); //오징어 전체적 사이즈 줄이기 
noStroke();
circle(358, 239, 30);
fill(squidColor);//fill은 항상 위로 가야 하는 거 같다
rect(290, 210, 198, 120, 26);//오징어 얼굴모형위치잡기
noStroke();
fill(patternColor);
circle(468, 295, 14);//얼굴무늬 

noStroke();
fill(squidColor);
triangle(264, 230, 388, 122, 510, 230);//오징어 대가리(세모)
fill(patternColor);
circle(405, 160, 25);//세모 무늬(큰거)
circle(428, 180, 15);//세모 무늬(작은거)

//fill(255);
//circle(364, 239, 48);
//circle(411, 239, 48);
//fill(0);
//circle(364, 239, 30);
//circle(411, 239, 30);// 오징어 양쪽 눈 여기까지

 // 눈의 위치 업데이트 (검은자만 이동)
  if (shouldMoveEyes) {
    leftEyeX += eyeDirection * eyeOffset; // 왼쪽 눈 x 위치 이동
    rightEyeX += eyeDirection * eyeOffset; // 오른쪽 눈 x 위치 이동

    // 이동 방향 변경: 좌우로 반복 이동
    if (leftEyeX > 370 || leftEyeX < 358) {
      eyeDirection *= -1; // 방향 반전
    }
  }
  
   // 왼쪽 눈 그리기
  noStroke();
  fill(255);
  circle(364, 239, 48); // 왼쪽 눈
  fill(0);
  circle(leftEyeX, 239, 30); // 왼쪽 눈 검은자
  
  // 오른쪽 눈 그리기
  fill(255);
  circle(411, 239, 48); // 오른쪽 눈
  fill(0);
  circle(rightEyeX, 239, 30); // 오른쪽 눈 검은자



fill(squidColor);
rect(368, 310, 38, 180,100);//오징어 가운데다리 여기까지(기동만)
fill(patternColor);
circle(387, 355, 22);
circle(387, 402, 22);
circle(387, 448, 22);// 오지어 다리 무늬

pushMatrix();//translate좌표계 복원
translate(303, 300);// 오징어 다리(왼쪽기준1)
rotate(0.2);//시계 반대 방향으로 회전 
fill(squidColor);
rect(33, -3, 38, 180, 100);//오징어 가운데다리 여기까지(기동만)
fill(patternColor);
circle(51, 42, 22);  
circle(51, 89, 22);  
circle(51, 135, 22);  // 오지어 다리 무늬
popMatrix();//좌표계 복원

pushMatrix();//translate좌표계 복원
translate(275, 283);// 오징어 다리(왼쪽기준2)s
rotate(0.41);//시계 반대 방향으로 회전 
fill(squidColor);
rect(33, -3, 38, 180, 100);//오징어 가운데다리 여기까지(기동만)
fill(patternColor);
circle(51, 42, 22);  
circle(51, 89, 22);  
circle(51, 135, 22);  // 오지어 다리 무늬
popMatrix();//좌표계 복원

pushMatrix();//translate좌표계 복원
translate(369, 320);// 오징어 다리(가운데에서 오른쪽으로1)
rotate(-0.2);//시계 반대 방향으로 회전 
fill(squidColor);
rect(33, -3, 38, 180, 100);//오징어 가운데다리 여기까지(기동만)
fill(patternColor);
circle(51, 42, 22);  
circle(51, 89, 22);  
circle(51, 135, 22);  // 오지어 다리 무늬
popMatrix();//좌표계 복원

pushMatrix();//translate좌표계 복원
translate(408, 327);// 오징어 다리(가운데에서 오른쪽으로2)
rotate(-0.41);//시계 반대 방향으로 회전 
fill(squidColor);
rect(33, -3, 38, 180, 100);//오징어 가운데다리 여기까지(기동만)
fill(patternColor);
circle(51, 42, 22);  
circle(51, 89, 22);  
circle(51, 135, 22);  // 오지어 다리 무늬
popMatrix();//좌표계 복원

noFill();
noStroke();//외곽선의 색상을 설명(가이드라인꺼)
//stroke(0);
line(380, 281, 385, 295);//곡선 만들기전 가이드 라인 
line(411, 268, 400, 296);
stroke(207,136, 95 );//오징어 입 
strokeWeight(2);
bezier(380, 281, 385, 295,  400, 296, 411, 268);
popMatrix();  // 좌표계를 원래 상태로 복원

 // 클릭 후 일정 시간 뒤에 눈이 다시 움직이도록 설정
  if (!shouldMoveEyes && millis() - lastClickTime > delayTime) {
    shouldMoveEyes = true; // 눈이 다시 움직이도록 설정
}


}

class Bubble {
  float x, y, speed;
  float diameter;

  // 버블 설정 
  Bubble() {
    x = random(width);     // X 좌표를 화면 전체에서 랜덤하게 설정
    y = height;            // Y 좌표는 화면 아래에서 시작
    speed = random(1, 5);  // 속도를 랜덤하게 설정
    diameter = random(13,69);  // 버블의 크기도 랜덤하게 설정
  }

  // 버블을 위로 이동시키는 함수
  void ascend() {
    y -= speed;            // Y 좌표를 속도만큼 위로 이동
    if (y < 0) {           // 화면을 넘어가면 아래로 다시 위치
      y = height;
      x = random(width);   // Y가 리셋될 때 X 좌표도 랜덤하게 다시 설정
    }
  }

  // 버블을 화면에 그리는 함수
  void display() {
    noStroke();
    fill(255, 100);        // 투명한 흰색으로 버블 그리기
    ellipse(x, y, diameter, diameter); // 버블 모양
  }
}


void mousePressed() {
  // 클릭할 때마다 랜덤한 색상으로 오징어의 색상 변경
  squidColor = color(random(255), random(255), random(255));
  patternColor = color(random(60,255));// 오징어 패턴 무늬 투명도, 랜덤컬러 설정 
  
   // 클릭 시 눈의 검은자를 원래 위치로 되돌림
  leftEyeX = originalLeftEyeX; 
  rightEyeX = originalRightEyeX; 
  shouldMoveEyes = false; // 눈이 움직이지 않도록 설정
  lastClickTime = millis(); // 클릭한 시간 기록
  
  
}
