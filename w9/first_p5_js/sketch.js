let tileNumX = 16;
let tileNumY = 12;

function setup() {
  createCanvas(640, 480);
}

function draw() {
  background('#333333');
  fill('cornflowerblue');
  for (let row = 0; row < tileNumY; row++) {
    for (let column = 0; column < tileNumX; column++) {
      let tileW = width / column;
      let tileH = height / row;
      let x = tileW * 0.5 + column * tileW;
      let y = tileH * 0.5 + row * tileH;
      ellipse(x, y, tileW, tileH);
    }
  }

  // for (let column = 0; column < width; column += 40) {
  //   for (let row = 0; row < width; row += 40) {
  //     let x = 20 + column;
  //     let y = 20 + row;
  //     let diameter = 30;
  //     noStroke();
  //     circle(x, y, diameter);
  //   }
  // }
  //n과 m이 동시에 필요할경우 같이 쓰지 말기!!!! 헛갈려잉
  //n쓰고 F2를 누르면 해당쓰인 이름을 모두 한번에 변경가능
}
// vs code에서는 int/ float이아닌 let 이나 var 로 사용한다(var는 요즘에 잘사용하지않김함)
