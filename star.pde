int type = 2;
void drawStar(){
  noStroke();
  fill(230, 230, 230);
  rectMode(CENTER);
  rect(width / 2, 150, 600, 50, 10);
  fill(255, 255, 255);
  if (type == 0) rect(width / 2 - 300 + 100, 150, 180, 40, 10);
  else if (type == 1) rect(width / 2 - 300 + 300, 150, 180, 40, 10);
  else if (type == 2) rect(width / 2 - 300 + 500, 150, 180, 40, 10);
  fill(40, 40, 40);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("早餐", width / 2 - 300 + 100, 150);
  text("午餐", width / 2 - 300 + 300, 150);
  text("晚餐", width / 2 - 300 + 500, 150);
  
  imageMode(CENTER);
  image(redHand, 450, height / 2);
  image(blueHand, 650, height / 2); 
  image(blackHand, 800, height / 2);
  
  textSize(18);
  textAlign(CENTER, CENTER);
  text("(平均一天的交易量)", 1000, 500);
  
  textSize(20);
  textAlign(CENTER, CENTER);
  fill(253, 106, 55);
  text(topValue[type][0], 450, 500);
  ellipse(width / 2 - 200, 550, 10, 10);
  fill(40, 77, 224);
  text(topValue[type][1], 650, 500);
  ellipse(width / 2 - 50, 550, 10, 10);
  fill(0, 0, 0);
  text(topValue[type][2], 800, 500);
  ellipse(width / 2 + 100, 550, 10, 10);
  
  fill(40, 40, 40);
  textSize(18);
  textAlign(LEFT, CENTER);
  text(topName[type][0], width / 2 - 190, 550);
  text(topName[type][1], width / 2 - 40, 550);
  text(topName[type][2], width / 2 + 110, 550);
  
}