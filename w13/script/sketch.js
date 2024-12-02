/*
 * 👋 Hello! This is an ml5.js example made and shared with ❤️.
 * Learn more about the ml5.js project: https://ml5js.org/
 * ml5.js license and Code of Conduct: https://github.com/ml5js/ml5-next-gen/blob/main/LICENSE.md
 *
 * This example demonstrates face tracking on live video through ml5.faceMesh.
 */
//나중에 자신이 만든 코드를 배포할때 자신의 각주를 넣어주는것이 중요!

let faceMesh;
let video;
let faces = []; //여러명일때 사용가능하기 때문
let options = { maxFaces: 1, refineLandmarks: false, flipHorizontal: false };
// flipHorizontal true로 하면 이미지가 반전된상태로 인식이됨(이럴떄 이미지도 같이 true로 해주어야한다)

function preload() {
  // Load the faceMesh model
  faceMesh = ml5.faceMesh(options);
}

function setup() {
  createCanvas(640, 480);
  // Create the webcam video and hide it
  video = createCapture(VIDEO);
  video.size(640, 480);
  video.hide(); //없으면 아래쪽에 p5js가 적용되지 않은 카메라가 작동해 보여짐
  // Start detecting faces from the webcam video
  faceMesh.detectStart(video, gotFaces); //
}

function draw() {
  // Draw the webcam video
  image(video, 0, 0, width, height);

  // Draw all the tracked face points
  for (let i = 0; i < faces.length; i++) {
    let face = faces[i];
    for (let j = 0; j < face.keypoints.length; j++) {
      let keypoint = face.keypoints[j];
      fill(0, 255, 0);
      noStroke();
      circle(keypoint.x, keypoint.y, 5);
    }
  }
}
//--> 콜백 자리는 함수!를 넣어주어야한다 하단 참고
// Callback function for when faceMesh outputs data
function gotFaces(results) {
  // Save the output to the faces variable
  faces = results;
}
