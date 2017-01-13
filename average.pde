int[][] colors = {{254, 151, 117}, {197, 139, 119}, {195, 113, 90}, {244, 124, 94}, {218, 118, 93}, {106, 131, 234}, {110, 126, 196}, {115, 125, 160}, {98, 97, 102}, {76, 76, 76}, {143, 205, 237}, {196, 178, 214}, {153, 134, 230}};
void drawAverage(){
  stroke(200, 200, 200);
  for (int i = 0; i < 13; ++i){
    line(100, 200 + 30 * i, 600, 200 + 30 * i);
    fill(40, 40, 40);
    textAlign(LEFT, BOTTOM);
    textSize(14);
    text(str(12 - i), 100, 198 + 30 * i);
  }
  for (int i = 0; i < 10; ++i){
    line(120 + 50 * i, 200, 120 + 50 * i, 560);
    fill(40, 40, 40);
    textAlign(CENTER, TOP);
    textSize(14);
    text(i * 20, 120 + 50 * i, 565);
  }
  textSize(20);
  textAlign(RIGHT, BOTTOM);
  text("一天的消费次数", 250, 140);
  textSize(14);
  textAlign(LEFT, BOTTOM);
  text("(随机取样1%)", 250, 140);
  
  textAlign(LEFT, CENTER);
  text("人次", 600, 560);
  
  fill(220, 65, 58);
  for (int i = 0; i < 198; ++i){
    fill(colors[volumnInPerson[i][2]][0], colors[volumnInPerson[i][2]][1], colors[volumnInPerson[i][2]][2]);
    ellipse(122.5 + i * 2.4, 560 - volumnInPerson[i][1] * 30, 5, 5);
  }
  
  stroke(200, 200, 200);
  for (int i = 0; i < 9; ++i){
    line(650, 200 + 45 * i, 1150, 200 + 45 * i);
    fill(40, 40, 40);
    textAlign(LEFT, BOTTOM);
    textSize(14);
    text(str((8 - i) * 12), 650, 198 + 45 * i);
  }
  for (int i = 0; i < 10; ++i){
    line(670 + 50 * i, 200, 670 + 50 * i, 560);
    fill(40, 40, 40);
    textAlign(CENTER, TOP);
    textSize(14);
    text(i * 20, 670 + 50 * i, 565);
  }
  
  textSize(20);
  textAlign(RIGHT, BOTTOM);
  text("一天的消费额", 800, 140);
  textSize(14);
  textAlign(LEFT, BOTTOM);
  text("(随机取样1%)", 800, 140);
  textAlign(LEFT, CENTER);
  text("人次", 1150, 560);
  
  fill(220, 65, 58);
  for (int i = 0; i < 198; ++i){
    fill(colors[volumnInPerson[i][2]][0], colors[volumnInPerson[i][2]][1], colors[volumnInPerson[i][2]][2]);
    ellipse(672.5 + i * 2.4, 560 - float(volumnInPerson[i][0]) / 100 * 45 / 12, 5, 5);
  }
}