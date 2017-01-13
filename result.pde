int currentRes = 1;

void Result(){
  noStroke();
  strokeWeight(1);
  fill(229, 88, 74);
  rectMode(CORNER);
  rect(0, height - 50, width, 50);
  textSize(14);
  textAlign(CENTER, CENTER);
  fill(40, 40, 40);
  if (currentRes == 0) fill(255, 255, 255);
  text("人均消费情况", width / 6, height - 25);
  fill(40, 40, 40);
  if (currentRes == 1) fill(255, 255, 255);
  text("各餐厅营业对比", width / 6 * 3, height - 25);
  fill(40, 40, 40);
  if (currentRes == 2) fill(255, 255, 255);
  text("明星餐厅-二餐的内部排名", width / 6 * 5, height - 25);
  
  fill(40, 40, 40);
  textAlign(RIGHT, TOP);
  text("点击下方按钮更换选项", width - 20, 20);
  
  if (currentRes == 0){
    drawAverage();
  } else if (currentRes == 1){
    drawComparison();
  } else if (currentRes == 2){
    drawStar();
  }
}