ArrayList<Drop> drops1;
int maxDrops = 150;
ArrayList<Group1> groups1;
ArrayList<GroupMain1> groupMains1;

ArrayList<Ball> Balls1;
boolean reset = false;
ArrayList<MBall>ballMain1;



int[] strokeColor = {
  0xFF22F0FF,
  0xFF2261FF,
  0xFF0095FF
};//part1 컬러 

int[] circleColor = {
  0xFF17FFE0,
  0xFFFF0894,
  0xFF1EF430,
  0xFFFBFF00,
  0xFFFF0A0A,
  0xFFFF8C00

};//part2 컬러 

int scene = 0;//첫번쨰 화면인것을 나타냄

void setup() {
  fullScreen();// 기존 작게 제작했던 비율과 fullscreen 비율이 달라져서 호환이 필요
  // 전체사이즈를 한번에 scale로 줄여 비율 맞추기
  //size(600, 600);
  initializerBalls();

  drops1 = new ArrayList<Drop>();
  groups1 = new ArrayList<Group1>();
  groupMains1 = new ArrayList<GroupMain1>();

  Balls1 = new ArrayList<Ball>();
  ballMain1 = new ArrayList<MBall>();




  int numGroups1 = int(random(35, 80));
  for (int idx = 0; idx < numGroups1; idx++ ) {
    float random1X = random(width);
    float random1Y = random(height);
    float random1Scale = random(0.15, 0.35);
    float random1Speed = random(0.5, 2);

    groups1.add(new Group1(random1X, random1Y, random1Scale, random1Speed, strokeColor));
  }
   // 가로 세로 랜덤한 거리상에 30 - 80개의 랜덤한 그룹을 분포시킴 크기는 0.15배 - 0.35배로 축소해 랜덤  설정 스피드도 0.5 - 2로 랜덤설

  groupMains1.add(new GroupMain1(0, 0, 0.5, strokeColor ));
  // 메인그룹 스케일 0.5사이즈 = 50퍼 

  int numBalls1 = int(random(40, 150));
  for (int idx = 0; idx < numBalls1; idx++) {
    float random2X = random(width);
    float random2Y = random(height);
    float random2Speed = random(2, 40);
    float random2Rad = random(5, 15);


    Balls1.add(new Ball(random2X, random2Y, random2Speed, random2Rad,
      circleColor[int(random(circleColor.length))]
      ));
  }
}

void draw() {
  background(0);

  if (scene == 0) {
    drawScene1();
  } else if (scene == 1) {
    drawScene2();
  }
}

void drawScene1() {
  background(0);


  int dropCount = int(map(mouseX, 0, width, 10, maxDrops));
  //맵핑화 시켜서 x축을 오른쪽으로 이동시킬수록 많은 수의 drop효과
  //추가 최소는 10 최대는 150 (최소로했을떄 왜인지 모르겠지만 groupdl 빨라지는거같다.. 기분탓..?)

  while (drops1.size() < dropCount) {
    drops1.add(new Drop());
  }
  while (drops1.size() > dropCount) {
    drops1. remove(drops1.size() -1);
  }
  //if 보다 반복구존에 whiledl 적합
  
  
  for (Drop d : drops1) {
    d.fallD();
    d.display2();
    //groupMains1.get(0).arrayListText1(d);// 추후 이해, 수정 필요 모든 정보 다나옴..
  }

  if (!drops1.isEmpty()) {
    Drop targetDrop = drops1.get(0);
    groupMains1.get(0).arrayListText1(targetDrop);
  } 
  //첫번째 객체에 대한 값만 출력 GPT

  for (Group1 g1 : groups1) {
    g1.update1();
    g1.bound1();
    g1.display1();
  }
  for (GroupMain1 gm1 : groupMains1) {
    gm1.update2();
    gm1.display3();
  }

  
}

//scene2에서 배경 컬러 변경
void drawScene2() {
  //background(0);

  if (reset) {
    initializerBalls();
    reset = false;
  }


  for (int idx = Balls1.size() - 1; idx >=0; idx--) {
    Ball B1 = Balls1.get(idx);

    B1.update3();
    B1.bound2();
    B1.display4();
  }
  
  
for (MBall MB1 : ballMain1 ) {
  MB1.update4();
  MB1.display5();
}

// Balls1 리스트의 첫 번째 Ball 정보를 출력
if (!Balls1.isEmpty()) {
  Ball firstBall = Balls1.get(0); // 첫 번째 Ball 선택
  firstBall.arrayListText2(firstBall); // 정보 출력
}

}






void mousePressed() {
  if (scene == 0) {
    scene =1;
    initializerBalls();
  } else if (scene ==1) {
    scene = 0;
  }
}
//else  {
//    scene = 0;// 또다른 scene 을 추가를 안할꺼면 else if 대신 사용가능
//  }


void keyPressed() {
  if (key == ENTER) {
    reset = true;
  }
}