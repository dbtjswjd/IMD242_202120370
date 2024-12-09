let slider = document.querySelector('#slider-1');
//함수를 가져올때 get/set모두 사용하는 의도가 다르기때문에 한번 알아두기!
//queryselector 가장많이 사용
console.log(slider); //console 에서 null은 아무것도 없다는뜻
console.log(slider.value);
let aNewDiv = document.createElement('div');
let textContents = document.createTextNode(slider.value);
aNewDiv.appendChild(textContents);
document.body.appendChild(aNewDiv); //중간값이 화면상에 표시되도록 하는 코드
