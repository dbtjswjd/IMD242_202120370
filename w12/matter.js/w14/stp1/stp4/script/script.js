let slider = document.querySelector('input'); //대소문자 document는 상관없지만 모듈이 아닐때는 소문자 사용 추천!
let valuePlace = document.querySelector('p');
console.log(slider);
console.log(valuePlace);
valuePlace.textContent = slider.value; //value값 자리 만들어놓고 text를 올리는 방식

slider.addEventListener('change', (event) => {
  console.log(slider.value);
  valuePlace.textContent = slider.value; //매변 변경될떄마다 값이 달라지도록 도와줌
}); //callback 구조 다시한번 곧부 보통 event 에서 줄이말 사용
//복잡한 구조일수록 바깥구조 먼저 만들고 그뒤 내부를 채우는 방식이 더 오타가 없다
