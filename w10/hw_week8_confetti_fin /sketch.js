const colours = ['#257180', '#f2e5bf', '#fd8b51', '#cb6040'];

let confetties = [];

let gravity = [0, 0.1];
let friction = [0.99];
let cnt = 0;
let mouse = [0, 0];

class Confetti {
  // float[] pos;
  // float[] vel;
  // float[] size;
  // int colour;
  // float ang;
  // float angVel;

  constructor(x, y, w, h, colour, force, angForce) {
    this.pos = [x, y];
    this.vel = [x, y];
    this.size = [w, h];
    this.colour = colour;

    let randomDir = radians(random(360));
    this.vel[0] = force * cos(randomDir);
    this.vel[1] = force * sin(randomDir);
    this.ang = radians(random(360));
    this.angVel = radians(angForce);
  }

  update(force, friction) {
    for (let idx = 0; idx < 2; idx++) {
      this.vel[idx] += force[idx];
      this.pos[idx] += this.vel[idx];
      this.vel[idx] *= friction;
    }

    this.ang += this.angVel;
    this.angVel *= friction;
  }

  display() {
    push();
    rectMode(CENTER);
    translate(this.pos[0], this.pos[1]);
    rotate(this.ang);
    noStroke();
    fill(this.colour);
    rect(0, 0, this.size[0], this.size[1]);
    pop();
  }

  getDiagonal() {
    let sumSquare = pow(this.size[0] * 0.5, 2) + pow(this.size[1] * 0.5, 2);
    return sqrt(sumSquare);
  }

  isOutOfScreen() {
    return (
      this.pos[0] < -this.getDiagonal() ||
      this.pos[0] > width + this.getDiagonal() ||
      this.pos[1] < -this.getDiagonal() ||
      this.pos[1] > height + this.getDiagonal()
    );
  }
}

function setup() {
  createCanvas(800, 800);
  mousePressed = myMousePressed;
}

function myMousePressed() {
  cnt = 0;
  mouse[0] = mouseX;
  mouse[1] = mouseY;
}

function mouseReleased() {
  console.log('gen' + cnt);
  gen(mouse[0], mouse[1], cnt);
}

function keyPressed() {
  if (key == 'p') {
    console.log('confetties' + confetties.length);
  }
}

function gen(x, y, n) {
  for (let idx = 0; idx < n; idx++) {
    let randomW = random(4, 20);
    let randomH = random(4, 20);
    let randomforce = random(1, 10);
    let randomAngForce = random(-30, 30);

    let newConfetti = new Confetti(
      x,
      y,
      randomW,
      randomH,
      colours[int(random(colours.length))],
      randomforce,
      randomAngForce
    );
    confetties.push(newConfetti);
  }
}

function draw() {
  if (mouseIsPressed) {
    cnt++;
  }

  background(0);
  for (let idx = confetties.length - 1; idx >= 0; idx--) {
    let aConfetti = confetties[idx];
    aConfetti.update(gravity, friction);
    if (aConfetti.isOutOfScreen()) {
      confetties.splice(idx, 1);
    }
  }

  for (let idx = 0; idx < confetties.length; idx++) {
    confetties[idx].display();
  }
}
