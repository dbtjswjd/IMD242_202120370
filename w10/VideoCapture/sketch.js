function setup() {
  createCanvas(400, 400);
  capture = createCapture(VIDEO);
  // createCamera는 3D를 설정할 때 필요한 카메라 사용에 관련된 함수
  // 지역 변수 전역 변수 주의
  console.log(capture);
  capture.size(200, 200);
  capture.hide();
}

function draw() {
  background(220);
  image(capture, 0, 0, width, height);
}
