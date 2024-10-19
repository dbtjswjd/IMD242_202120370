int[] fruitAmts;
String[] fruitNames = {"mango",
  "strawberry",
  "kiwi",
  "plum",
  "blueberry"
};
color[] fruitColors;
color[] textColors;

void setup() {
  size(1280, 720 );
  //background(0);
  fruitAmts = new int[fruitNames. length];
  for (int n = 0; n < fruitAmts. length; n++) {
    if (n == 0) {
      fruitAmts[n] = 55;
    } else {
      fruitAmts[n] = int(random(50, 120));
    }
  }

  fruitColors = new color [fruitNames. length];
  fruitColors[0] = color(255, 100, 100);
  fruitColors[1] = color(253, 255, 120);
  fruitColors[2] = color(180, 255, 158);
  fruitColors[3] = color(157, 255, 242);
  fruitColors[4] = color(220, 179, 255);

  textColors = new color [fruitNames. length];
  textColors[0] = color(255, 0, 0);
  textColors[1] = color(248, 255, 78);
  textColors[2] = color(55, 255, 0);
  textColors[3] = color(0, 255, 221);
  textColors[4] = color(185, 118, 255);
}


float barGap = 225;
float barWidth = 45;
float x = 180;
float rectWeight = 2;


void draw() {
  background(0);
  rectMode(CENTER);

  //strokeWeight(barWidth);
int total = 0;
for(int n = 0; n < fruitAmts.length; n++) {
  total += fruitAmts[n];
}
int average = total / fruitAmts.length;
int T = total;


  for (int n = 0; n < fruitNames.length; n++) {
    stroke(fruitColors[n]);
    strokeCap(SQUARE);
    textAlign(CENTER);
    textSize(24);
    //fill(255);

    strokeWeight(barWidth);
    line(x + barGap * n, height * 0.5 + 20,
      x + barGap * n, height * 0.5 - 2 * fruitAmts[n]);



    strokeWeight(2);
    //stroke(fruitColors[n]);
    stroke(110);
    noFill();
    rect( x + barGap * n, height * 0.5 - 116, 45, height * 0.5 - 90);
    //rectMode();


    //strokeWeight(2);
    //line(x + barGap * n, 0,
    //  x + barGap * n, 100);
    textSize(26);
    fill(textColors[n]);
    text(fruitNames[n],
      x + barGap * n, height * 0.5 + 72);

    textSize(23);
    fill(112, 112, 112);
    text( " qty : ",
      x + barGap * n - 20, height * 0.5 + 112);

    textSize(23);
    fill(112, 112, 112);
    text(fruitAmts [n],
      x + barGap * n + 20, height * 0.5 + 112);
  }

  textSize(45);
  fill(255);
  text("AVERAGE NUMBER OF FRUITS : ",
    width * 0.5 - 10, height * 0.5 + 235);

  textSize(45);
  fill(255);
  text(average, width * 0.5 + 310, height * 0.5 + 235);
  
  textSize(24);
  fill(255);
  text("TOTAL : ", 1170, 48);
  
  
  textSize(24);
  fill(255);
  text(T, 1235, 48);
  
  
}