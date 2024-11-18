let cp; // VIDEO에 다른 명령어를 입력하기 위해 변수로 변환 제작
let canvasW, canvasH;
let scale;
let cpW, cpH;

function setup() {
  canvasW = 640;
  canvasH = 480;
  createCanvas(canvasW, canvasH);

  scale = 0.1;
  cpW = canvasW * scale;
  cpH = canvasH * scale;
  cp = createCapture(VIDEO);
  cp.hide();
  cp.size(cpW, cpH); //정수가 아니면 가끔 문제가 생길 수도있음
}

function draw() {
  background(25, 230, 200);
  cp.loadPixels();
  // for (let idx = 0; idx < cp.pixels.length; idx++)
  //나누기 4할때 소수점 걱정 X 어차피 4의 배수!
  for (let idx = 0; idx < cp.pixels.length / 4; idx++) {
    // let colour = cp.pixels[idx];
    let r = cp.pixels[4 * idx];
    let g = cp.pixels[4 * idx + 1];
    let b = cp.pixels[4 * idx + 2];
    let a = cp.pixels[4 * idx + 3];
    let br = brightness([r, g, b]);
    let dia = map(br, 0, 255, 0, 40);
    let x = idx % cpW;
    let y = floor(idx / cpW);

    fill(0);
    circle(10 * x + 5, 10 * y + 5, dia);
  }
}
