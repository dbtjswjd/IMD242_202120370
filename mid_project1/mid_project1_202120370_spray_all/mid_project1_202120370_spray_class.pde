void initializerBalls() {
Balls1 = new ArrayList<Ball>();
ballMain1 = new ArrayList<MBall>();
//챗 gpt활용 keypressed 상용시 내가원하는 키에다가 동작 입력가능 
//전체 리셋시키기 


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
  ballMain1.add(new MBall (width * 0.5, height * 0.5, 30, color(255, 245, 0)));
}


//날아 다닐 오브제 제작(작은 화면을 제작후 전체를 묶어서 fullScreen 으로 옮김)
class Particle {
  float Ax, Ay; // 중심
  float Cx1, Cy1, Cx2, Cy2, Cx4, Cy4; // 곡선 변수

  int strokeColor;// 색상 변수는 무조건 정수!! 안그러면 안보인다!!!!
  float strokeWe1;


  Particle(float Ax, float Ay,
    float Cx1, float Cy1, float Cx2, float Cy2, float Cx4, float Cy4, int strokeColor) {

    this.Ax = Ax;
    this.Ay = Ay;

    this.Cx1 = Cx1;
    this.Cy1 = Cy1;
    this.Cx2 = Cx2;
    this.Cy2 = Cy2;
    this.Cx4 = Cx4;
    this.Cy4 = Cy4;

    this.strokeColor = strokeColor;
    this. strokeWe1 = 3.5;
  }

  void particle1() {
    pushMatrix();//곡선 반전시키기
    translate(Ax, Ay);
    stroke(strokeColor);
    strokeWeight(strokeWe1);
    noFill();

    curve(Cx1, Cy1, Cx2, Cy2, 0, 0, Cx4, Cy4);//곡선1
    //curve(-15, 590, -60, -10, 0, 0, 0, 210); 기존 제작시 커브 값1

    line(0, -103, 0, 0); // 중심축

    popMatrix();
  }

  void particle2() {
    pushMatrix();
    translate(Ax, Ay);
    scale(-1, 1);
    stroke(strokeColor);
    strokeWeight(strokeWe1);
    noFill();
    curve(Cx1, Cy1, Cx2, Cy2, 0, 0, Cx4, Cy4);
    popMatrix();// 반전 될 커브1
  }

  void drawCircle(float rad) {
    pushMatrix();
    translate(Ax, Ay);
    stroke(strokeColor);
    strokeWeight(strokeWe1);
    fill(255);
    circle(0, 0, rad);
    popMatrix();// 중심 원
  }
}

class Group1 {
  float Bx, By;
  float scaleValue;//파티클 그룹 전체 크기 조절
  float gax, gay; // 이동속도 변수
  float circleRad = 20;
  Particle draw1, draw2;


  Group1(float g1x, float g1y, float scaleValue, float g1speed, int[] strokeColor) {
    this.Bx = g1x;
    this.By = g1y;
    this.scaleValue = scaleValue;

    float deg = random(360); // deg 이동 방향을 나타내는 변수
    gax = g1speed * cos(radians(deg)); //x축 이동 속도
    gay = g1speed * sin(radians(deg));  //y축 이동 속도

    int randomColor1 = strokeColor[int(random(strokeColor.length))];
    //array나 list가 많을 수록 length 최고..!

    this.draw1 = new Particle(0, 0, -15, 690, -70, -13, -80, 450, randomColor1);
    this.draw2 = new Particle(0, 0, 0, 200, -30, -90, -30, 320, randomColor1);
    //도형을 초기화 시켜주어야 비율이 망가지지않고 계속 새롭게 그려지며 생성이됨(절댓값으로 직접 부여)
    //순서가 바뀌어 보이는 이유는 Ax, Ay초기의 내가 설정한 위치와  그뒤에 내가 설정했던 Cx1, Cy1..
    //이런식으로 변경 값을 직접 입력해주기 때문 chat GPT 질문 후 사용 
  }
  void update1() {
    Bx += gax;
    By += gay;
  }

  void bound1() {
    if (Bx > width +5) {
      Bx = -5;//왼쪽기준
    } else if (Bx < -5) {
      Bx = width +5;//오른쪽 기준
    }

    if (By > height + 5) {
      By = 5;//위쪽 기준
    } else if (By < -5) {
      By = height + 5;//아래쪽 기준
    }
}


void display1() {
    pushMatrix();
    translate(Bx, By);
    scale(scaleValue);

    draw1.particle1();// 변수를 저장했기때문에 수를 일일 이 적을 필요없이 바로 적용가능draw1.정방향/ draw2.반전
    draw1.particle2();
    draw1.drawCircle(circleRad);

    draw2.particle1();
    draw2.particle2();

    popMatrix();
  }
}

class Drop {
  float Cx, Cy;
  float Cyspeed;
  float Dleng; // 길이
  float opacity1;
  int dropstrokeColor;
  // 코딩 트레인 선생님  비내리는 듯한 코드 참고 https://www.youtube.com/watch?v=KkyIDI6rQJI

  Drop() {
    Cx = random(width);
    Cy = random(-400, 400);// x축은 랜덤으로 두지만 y축은 랜덤 구간을 설정해야지 내가 원하는 느낌으로 나옴
    Cyspeed = random(0.1, 3);
    Dleng = random(200, 1000); // 길게 설정
    opacity1 = random(15, 50); // 뒤에 깔리는 배경느낌으로
    dropstrokeColor = strokeColor [int(random(strokeColor.length))];
  }

  void fallD() {
    Cy += Cyspeed;
    if (Cy > height) {
      Cy = random(0, 400 );// drop이 화면 바깥으로 나가면 0,400사이의 랜덤한 수로 적용후 다시 실행 
    }
  }

void display2() {
    pushMatrix();

    translate(Cx, Cy);
    rotate(radians(-15)); // 15도 꺾기 
    stroke(dropstrokeColor, opacity1);
    line(0, 0, 0, Dleng); //y축의 길이만 조절 

    popMatrix();
  }
}


  class GroupMain1 {
    float scaleValue2;//파티클 그룹 전체 크기 조절
    float gbx, gby;
    float circleRad2 = 30;
    Particle draw1, draw2;

    GroupMain1(float g2x, float g2y, float scaleValue2, int[] strokeColor) {
      this.gbx = g2x;
      this.gby = g2y;
      this.scaleValue2 = scaleValue2;

      int randomColor1 = strokeColor[int(random(strokeColor.length))];

      this.draw1 = new Particle(0, 0, -15, 690, -70, -13, -80, 450, randomColor1);
      this.draw2 = new Particle(0, 0, 0, 200, -30, -90, -30, 320, randomColor1);// 똑같이 적용!!
    }

    void update2() {
      gbx += (mouseX - gbx)* 0.125;
      gby += (mouseY - gby)* 0.125;
    }//마우스 따라다니는 메인개체 부드러운 움직임 chat GPT질문

    void display3() {
      pushMatrix();
      translate(gbx, gby);
      scale(scaleValue2);

      draw1.particle1();
      draw1.particle2();


      draw2.particle1();
      draw2.particle2();
      draw1.drawCircle(circleRad2);

      popMatrix();
    }

    void arrayListText1(Drop drop) {
      fill(255);
      textSize(17);
      textAlign(LEFT);
      text(
        "Cx: " + int(drop.Cx) +
        "\nCy: " + int(drop.Cy) +
        "\nLength: " + int(drop.Dleng) +
        "\nOpacity: " + int(drop.opacity1),
        10, 30);// 10, 30에 위치하고 drop의 변수를 정수로 변환 
    }
  }


  class Ball {
  float Ex, Ey;
  float Evx, Evy;
  float Brad;
  int circleColor;
  float maxSpeed = 10;
  float minSpeed = 2;
  float firction = 0.99;

  Ball(float Ex, float Ey, float Bspeed, float Brad, int circleColor) {
    this.Ex = Ex;
    this.Ey = Ey;
    float deg = random(360);
    Evx = Bspeed * cos(radians(deg));
    Evy = Bspeed * sin(radians(deg));
    this.Brad = Brad;
    this.circleColor = circleColor;
  }

  void update3( ) {
    Ex += Evx;
    Ey += Evy;

    Evx *= firction;
    Evy *= firction;
    //float friction, float minSpeed
    //부딛히고 멈추지않는 변수 마찰 어려웡 담에하기
  }

  void bound2() {
    if ( Ex < Brad || Ex > width -Brad) {
      Evx *= -1;
    }
    if ( Ey < Brad || Ey > height -Brad) {
      Evy *= -1;
    }
  }

  void display4() {
    noStroke();
    fill(circleColor);
    circle(Ex, Ey, 2*Brad);
  }

  void arrayListText2(Ball ball) {
    fill(255);
    textSize(17);
    textAlign(LEFT);

    text(
      "EX : " + int(ball.Ex) +
      "\nEy : " + int(ball.Ey) +
      "\nSpeed : " + nf(sqrt(ball.Evx * ball.Evx  + ball.Evy * ball.Evy), 0, 2), 10, 30

      );
  }
}

class MBall {
  float MBx, MBy;
  float MBrad;
  int MBcol;

  MBall(float MBx, float MBy, float MBrad, int MBcol) {
    this.MBx = MBx;
    this.MBy = MBy;
    this.MBrad = MBrad;
    this.MBcol = MBcol;
    //this.MBcol = color(255, 234, 0);
  }

  void update4() {
    MBx = mouseX;
    MBy = mouseY;
  }



  void display5() {
    pushMatrix();
    translate(MBx, MBy);
    fill(MBcol);
    circle(0, 0, 2* MBrad);


    popMatrix();
  }
  
  
}