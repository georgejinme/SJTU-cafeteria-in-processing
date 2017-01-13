void Total(){
  textSize(24);
  fill(40, 40, 40);
  textAlign(CENTER);
  text("2014-2015秋季学期，27770名交大学子曾在食堂有消费记录", width / 2, 100);
  
  drawGenderPortionsInPieChart();
  drawEducationPortionsInBarChart();
  
  imageMode(CENTER);
  image(nextArrow, width / 2, 550);
  textSize(10);
  fill(40, 40, 40);
  textAlign(CENTER);
  text("查看研究结果", width / 2, 610);
}

void drawGenderPortionsInPieChart(){
  noStroke();
  fill(40, 77, 224);
  arc(300, 350, 200, 200, 0, genderPortions[0] * TWO_PI, PIE);
  fill(253, 106, 55);
  arc(300, 350, 200, 200, genderPortions[0] * TWO_PI, TWO_PI, PIE);
  fill(255, 255, 255);
  ellipse(300, 350, 130, 130);
  
  textSize(14);
  fill(40, 40, 40);
  textAlign(CENTER);
  text("性别", 300, 355);
  
  stroke(40, 77, 224);
  line(250, 437, 245, 446);
  fill(40, 77, 224);
  textAlign(CENTER);
  text(str(genderPortions[0] * 100) + "%", 245, 462);
  
  stroke(253, 106, 55);
  line(350, 263, 355, 254);
  fill(253, 106, 55);
  textAlign(CENTER);
  text(str(genderPortions[1] * 100) + "%", 358, 250);
  
  noStroke();
  fill(40, 77, 224);
  ellipse(250, 550, 10, 10);
  fill(40, 40, 40);
  textAlign(CENTER);
  text("汉子", 275, 555);
  
  fill(253, 106, 55);
  ellipse(310, 550, 10, 10);
  fill(40, 40, 40);
  textAlign(CENTER);
  text("妹子", 335, 555);
}

void drawEducationPortionsInBarChart(){
  stroke(0, 0, 0);
  line(600, 250, 600, 450);
  stroke(200, 200, 200);
  for (int i = 0; i < 12; ++i){
    line(650 + i * 50, 250, 650 + i * 50, 450);
    fill(40, 40, 40);
    textAlign(CENTER);
    text(str((i + 1) * 5), 640 + i * 50, 450);
  }
  
  fill(40, 40, 40);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("本科", 570, 250 + 33.33);
  text("硕士", 570, 250 + 99.99);
  text("博士", 570, 250 + 166.66);
  
  noStroke();
  rectMode(CENTER);
  fill(29, 61, 191);
  rect(600 + educationPortions[0] * 100 * 5, 250 + 33.33, educationPortions[0] * 100 * 10, 33.33);
  fill(40, 77, 224);
  rect(600 + educationPortions[1] * 100 * 5, 250 + 99.99, educationPortions[1] * 100 * 10, 33.33);
  fill(18, 34, 97);
  rect(600 + educationPortions[2] * 100 * 5, 250 + 166.66, educationPortions[2] * 100 * 10, 33.33);
  
  textSize(14);
  textAlign(LEFT, CENTER);
  fill(255, 255, 255);
  text(str(educationPortions[0] * 100) + "%", 610, 250 + 33.33);
  text(str(educationPortions[1] * 100) + "%", 610, 250 + 99.99);
  text(str(educationPortions[2] * 100) + "%", 610, 250 + 166.66);
}