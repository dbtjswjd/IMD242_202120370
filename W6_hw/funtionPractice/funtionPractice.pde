int randomSeed = int(random(10000));


void setup() {
  size(800, 800);
}
void mousePressed() {
  randomSeed = int(random(10000));
}

void draw() {
  randomSeed(randomSeed);
  background(0);

  house(random(0.025 * width, 0.35 * width), 554);
}

void house(float x, float h) {
  pushMatrix();
  translate(x, 0);

  if (random(5) < 1) {
    H1(h);
  } else if (random(5) < 2) {
    H2(h);
  } else if (random(5) < 3) {
    H3(h);
  } else if (random(5) < 4) {
    H4(h);
  } else {
    H5(h);
  }


  //H1(h);
  //H2(h);
  //H3(h);
  //H4(h);
  //H5(h);

  popMatrix();
}

void H1(float h) {
  fill(255);
  rect(0, height - h, 227, h);

  fill(217);
  rect(227 / 2 - 83 /2, h + 100, 83, 146); // 중심 문 배치

  noStroke();
  fill(178, 233, 255);
  float H1leftWx = 227 - 200;
  float H1leftWy = height - 500;
  float H1wSize = 65;
  rect(H1leftWx, H1leftWy, H1wSize, H1wSize);// 창문왼

  for (int n = 0; n < 4; n++) {
    float H1leftWs = H1leftWy + n * (H1wSize + 20);
    rect (H1leftWx, H1leftWs, H1wSize, H1wSize);
  } //왼쪽 4개


  float H1rightWx = 227 - 90;
  float H1rightWy = height - 500;
  rect(H1rightWx, H1rightWy, H1wSize, H1wSize);//창문오

  for (int n = 0; n < 4; n++) {
    float H1rightWs = H1rightWy + n * (H1wSize + 20);
    rect (H1rightWx, H1rightWs, H1wSize, H1wSize);
  } //오른쪽 4개
}

void H2(float h) {
  fill(248, 255, 157);
  rect(0, height - h, 227, h);

  fill(217);
  rect(227 / 2 - 83 /2, h + 100, 83, 146); // 중심 문 배치

  noStroke();
  fill(178, 233, 255);
  float H1leftWx = 227 - 200;
  float H1leftWy = height - 500;
  float H1wSize = 65;
  rect(H1leftWx, H1leftWy + (H1wSize + 20), H1wSize, H1wSize);// 창문왼



  float H1rightWx = 227 - 90;
  float H1rightWy = height - 500;
  rect(H1rightWx, H1rightWy, H1wSize, H1wSize);//창문오

  for (int n = 0; n < 2; n++) {
    float H1rightWs = H1rightWy + n * (H1wSize + 120);
    rect (H1rightWx, H1rightWs, H1wSize, H1wSize);
  } //오른쪽 4개
}

void H3(float h) {
  fill(255, 174, 187);
  rect(0, height - 283, 537, h + 40);

  fill(217);
  rect(537 / 2 - 83 /2, h + 100, 83, 146); // 중심 문 배치

  noStroke();
  fill(178, 233, 255);
  float H1leftWx = 227 - 182;
  float H1leftWy = height - 250;
  float H1wSize = 65;
  rect(H1leftWx, H1leftWy, H1wSize, H1wSize);// 창문왼

  for (int n = 0; n < 5; n++) {
    float H1leftWs = H1leftWx + n * (H1wSize + 30);
    rect (H1leftWs, H1leftWy, H1wSize, H1wSize);
  } //왼쪽 4개
}


void H4(float h) {
  fill(255);
  rect(0, height - 606, 537, h + 200 );

  fill(217);
  rect(537 / 2 - 202 /2, h + 100, 202, 146); // 중심 문 배치

  noStroke();
  fill(178, 233, 255);
  float H1leftWx = 227 - 182;
  float H1leftWy = height - 566;
  float H1wSize = 65;
  rect(H1leftWx, H1leftWy, H1wSize, H1wSize);// 창문왼

  for (int n = 0; n < 5; n++) {
    for (int y = 0; y < 4; y++) {
      float H1leftWs = H1leftWx + n * (H1wSize + 30);
      float H1downWs = H1leftWy + y * (H1wSize + 40);
      rect (H1leftWs, H1downWs, H1wSize, H1wSize);
    }
  } //왼쪽 4개
}

void H5(float h) {
  fill(255);
  triangle(0, height - 283, 537 /2, height - 283 - 200, 537, height - 283);

  fill(248, 255, 157);
  rect(0, height - 283, 537, h + 60);

  fill(217);
  rect(537 / 2 - 83 /2, h + 100, 83, 146); // 중심 문 배치

  noStroke();
  fill(178, 233, 255);
  float H1leftWx = 227 - 182;
  float H1leftWy = height - 250;
  float H1wSize = 65;
  rect(H1leftWx, H1leftWy, H1wSize, H1wSize);// 창문왼

  for (int n = 0; n < 5; n++) {
    float H1leftWs = H1leftWx + n * (H1wSize + 30);
    rect (H1leftWs, H1leftWy, H1wSize, H1wSize);
  } //왼쪽 4개
}
