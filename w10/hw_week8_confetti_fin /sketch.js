let confetties = [];

function setup() {
  createCanvas(800, 800);

  for (let i = 0; i < 50; i++) {
    let x = random(width);
    let y = random(height);
    let w = random(10, 20);
    let h = random(10, 20);
    let colour = color(random(255), random(255), random(255));
    let force = random(2, 5);
    let angForce = random(0, 10);
    confetties.push(new Confetti(x, y, w, h, colour, force, angForce));
  }
}

function draw() {
  background(255);

  for (let i = confetties.length - 1; i >= 0; i--) {
    let aConfetti = confetties[i];
    aConfetti.update([0, 0.1], 0.99);
    if (aConfetti.isOutOfScreen()) {
      confetties.splice(i, 1);
    }
    aConfetti.display();
  }
}

class Confetti {
  constructor(x, y, w, h, colour, force, angForce) {
    this.pos = createVector(x, y);
    this.vel = createVector(0, 0);
    this.size = createVector(w, h);
    this.colour = colour;
    this.ang = random(TWO_PI);
    this.angVel = radians(angForce);
    this.init(force);
  }

  init(force) {
    let randomDir = random(TWO_PI);
    this.vel.x = force * cos(randomDir);
    this.vel.y = force * sin(randomDir);
  }

  update(force, friction) {
    this.vel.add(createVector(0, force[1]));
    this.pos.add(this.vel);
    this.vel.mult(friction);

    this.ang += this.angVel;
    this.angVel *= friction;
  }

  display() {
    push();
    rectMode(CENTER);
    translate(this.pos.x, this.pos.y);
    rotate(this.ang);
    noStroke();
    fill(this.colour);
    rect(0, 0, this.size.x, this.size.y);
    pop();
  }

  getDiagonal() {
    let sumSquare = pow(this.size.x * 0.5, 2) + pow(this.size.y * 0.5, 2);
    return sqrt(sumSquare);
  }

  isOutOfScreen() {
    return (
      this.pos.x < -this.getDiagonal() ||
      this.pos.x > width + this.getDiagonal() ||
      this.pos.y < -this.getDiagonal() ||
      this.pos.y > height + this.getDiagonal()
    );
  }
}
