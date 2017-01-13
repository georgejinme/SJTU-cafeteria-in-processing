int currentMonth = 9;
int currentPageInComparison = 0;
int[] colorR = new int[]{220, 40, 48, 57, 8, 32, 0};
int[] colorG = new int[]{65, 77, 73, 69, 21, 29, 0};
int[] colorB = new int[]{28, 224, 171, 119, 75, 39, 0};

void drawComparison(){
  noStroke();
  String[] months = new String[]{"九月", "十月", "十一月", "十二月", "一月"};
  fill(230, 230, 230);
  rectMode(CENTER);
  rect(width / 2, 100, 600, 45, 10);
  fill(255, 255, 255);
  rect(width / 2 - 300 + 60 + (currentMonth - 9) * 120, 100, 60, 40, 10);
  fill(40, 40, 40);
  textAlign(CENTER, CENTER);
  textSize(18);
  for (int i = 0; i < 5; ++i){
    text(months[i], width / 2 - 300 + 60 + i * 120, 100);
  }
  if (currentPageInComparison == 0) drawVolumnInMonth(volumnInMonths[currentMonth - 9]);
  else if (currentPageInComparison == 1) drawVolumnInTime(volumnInTime[currentMonth - 9]);
}

void drawVolumnInMonth(int[] volumn){
  String[] canteens = new String[]{"一餐", "二餐", "三餐", "四餐", "五餐", "六餐", "哈乐"};
  stroke(0, 0, 0);
  line(300, 200, 300, 600);
  textAlign(RIGHT, BOTTOM);
  textSize(14);
  text("0", 295, 600);
  stroke(200, 200, 200);
  for (int i = 0; i < 7; ++i){
    line(300 + (i + 1) * 97, 200, 300 + (i + 1) * 97, 600);
    fill(40, 40, 40);
    text(5000 + i * 5000, 300 + (i + 1) * 97 - 5, 600);
    if (i == 6){
      textSize(18);
      fill(40, 40, 40);
      textAlign(LEFT, BOTTOM);
      text("交易额", 300 + (i + 1) * 97 + 10, 600);
    }
  }
  noStroke();
  for (int i = 0; i < 7; ++i){
    fill(40, 40, 40);
    textAlign(RIGHT, CENTER);
    textSize(18);
    text(canteens[i], 300 - 5, 226 + i * 52);
    rectMode(CENTER);
    fill(colorR[i], colorG[i], colorB[i]);
    rect(300 + float(volumn[i] / 100) * 97 / 5000 / 2, 226 + i * 52, float(volumn[i] / 100) * 97 / 5000, 46);
    textSize(14);
    fill(40, 40, 40);
    textAlign(LEFT, CENTER);
    text(str(volumn[i] / 100), 300 + float(volumn[i] / 100) * 97 / 5000 + 5, 226 + i * 52);
  }
  imageMode(CENTER);
  image(rightArrow, 1180, height / 2);
}

void drawVolumnInTime(int[][] volumn){
  String[] canteens = new String[]{"一餐", "二餐", "三餐", "四餐", "五餐", "六餐", "哈乐"};
  imageMode(CENTER);
  image(leftArrow, 100, height / 2);
  
  textSize(14);
  textAlign(CENTER, CENTER);
  for (int i = 0; i < 7; ++i){
    fill(colorR[i], colorG[i], colorB[i]);
    ellipse(487 + i * 50, 620, 10, 10);
    fill(40, 40, 40);
    text(canteens[i], 510 + i * 50, 620);
  }
  
  textSize(14);
  fill(40, 40, 40);
  textAlign(CENTER, TOP);
  stroke(200, 200, 200);
  for (int i = 0; i < 17; ++i){
    line(320 + i * 40, 160, 320 + i * 40, 560);
    text(str(i + 4), 320 + i * 40, 568);
    if (i == 16){
      textSize(18);
      textAlign(LEFT, TOP);
      text("时间(整点)", 320 + i * 40 + 40, 565);
    }
  }
  textSize(14);
  fill(40, 40, 40);
  textAlign(LEFT, BOTTOM);
  for (int i = 0; i < 10; ++i){
    line(290, 160 + 44.44 * i, 988, 160 + 44.44 * i);
    text(10800 - 1200 * i, 280, 160 + 44.44 * i - 5);
  }
  textSize(18);
  textAlign(RIGHT, CENTER);
  text("交易额", 260, 160);
  
  for (int i = 0; i < 7; ++i){
    fill(colorR[i], colorG[i], colorB[i]);
    strokeWeight(2);
    for (int j = 0; j < 16; ++j){
      stroke(colorR[i], colorG[i], colorB[i]);
      line(320 + j * 40, 560 - float(volumn[i][j] / 100) * 44.44 / 1200, 320 + (j + 1) * 40, 560 - float(volumn[i][j + 1] / 100) * 44.44 / 1200);
      stroke(255, 255, 255);
      ellipse(320 + j * 40, 560 - float(volumn[i][j] / 100) * 44.44 / 1200, 10, 10);
    }
  }
}