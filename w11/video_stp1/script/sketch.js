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
  background(255);
  // image(cp, 0, 0, width, height); // 작게만든 화면을 크게늘리며 픽셀화처럼 해상도를 낮춤
  for (let y = 0; y < cpH; y++) {
    for (let x = 0; x < cpW; x++) {
      let colour = cp.get(x, y);
      fill(colour[0], colour[1], colour[2]);
      circle(10 * x + 5, 10 * y + 5, 10);
    }
  }
}
//plug in과의 차이 단순함 & Js.confic덕분에 자동완성이 되지만 직접만든것은 자동완성이 안됨...!
//직접 연결해주면 사용할 수 있다!! but 사이트를 직접만들떄는 직접 제작해서 작성하는것이 나음 더 빠르다
