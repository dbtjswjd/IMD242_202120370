let cnavasContainer = document.querySelector('#canvas-container'); //html은 띄어쓰기를 - 로 주로 사용 p5js는 대문자로 사용
let sizeSlider = document.querySelector('.range.range-size');
console.log(sizeSlider);

let rgbSlider = document.querySelectorAll('.range.range-color');
console.log(rgbSlider);

let valueOutPlace = document.querySelectorAll('.value');

// rgbSlider[0].addEventListener('change', (event) => {
//   valueOutPlace[0].textContent = rgbSlider[0].value;
// });

rgbSlider.forEach((eachRgbSlider, idx) => {
  eachRgbSlider.addEventListener('change', (e) => {
    valueOutPlace[idx].textContent = eachRgbSlider.value;
  });
});

function setup() {
  createCanvas(400, 400).parent(cnavasContainer);
}

function draw() {
  background(220);
  fill(rgbSlider[0].value, rgbSlider[1].value, rgbSlider[2].value);
  circle(mouseX, mouseY, sizeSlider.value);
  fill(0);
  // text(rgbSlider[0].value, 8, 16);
  // text(rgbSlider[1].value, 8, 32);
  // text(rgbSlider[2].value, 8, 48);
}
