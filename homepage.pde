PImage bg, nextArrow, leftArrow, rightArrow, redHand, blueHand, blackHand, back;
PFont font;
Table data;

int currentPage = 0;

//all the data we need
float[] genderPortions = new float[2];
float[] educationPortions = new float[3];
int[][] volumnInMonths = new int[5][7];
int[][][] volumnInTime = new int[5][7][17];
int[][] volumnInPerson = new int[198][3];
String[][] topName = new String[3][3];
int[][] topValue = new int[3][3];


void setup(){
  size(1280, 720);
  
  font = createFont("Helvetica", 20);
  textFont(font);
  
  bg = loadImage("bg.jpg");
  nextArrow = loadImage("nextArrow.png");
  leftArrow = loadImage("leftArrow.png");
  rightArrow = loadImage("rightArrow.png");
  redHand = loadImage("red.png");
  blueHand = loadImage("blue.png");
  blackHand = loadImage("black.png");
  back = loadImage("back.png");
  data = loadTable("data.csv", "header");
  
  getGenderPortion();
  getEducationPortion();
  getVolumnInMonths();
  getVolumnInTime();
  getVolumnAndTimesInPerson();
  getStarInTime();
}



void draw(){
  background(255, 255, 255);
  if (currentPage != 0){
    imageMode(CORNER);
    image(back, 20, 20);
  }
  switch (currentPage){
    case 0:
      Homepage();
      break;
    case 1:
      Total();
      break;
    case 2:
      Result();
      break;
    default:
      break;
  }
}

void mousePressed(){
  if (currentPage == 0){
    if (mouseX >= 300 - nextArrow.width / 2 && mouseX <= 300 + nextArrow.width / 2 && mouseY >= 450 - nextArrow.height / 2 && mouseY <= 450 + nextArrow.height / 2){
      currentPage = 1;
    }
  } else if (currentPage == 1){
    if (mouseX >= width / 2 - nextArrow.width / 2 && mouseX <= width / 2 + nextArrow.width && mouseY >= 550 - nextArrow.height / 2 && mouseY <= 550 + nextArrow.height / 2){
      currentPage = 2;
    }
  } else if (currentPage == 2){
    if (currentRes == 1){
      for (int i = 0; i < 5; ++i){
        if (mouseX >= width / 2 - 300 + i * 120 && mouseX <= width / 2 - 300 + (i + 1) * 120 && mouseY >= 78 && mouseY <= 122){
          currentMonth = i + 9;
          break;
        }
      }
      if (currentPageInComparison == 0){
        if (mouseX >= 1180 - rightArrow.width / 2 && mouseX <= 1180 + rightArrow.width / 2 && mouseY >= height / 2 - rightArrow.height / 2 && mouseY <= height / 2 + rightArrow.height / 2){
          currentPageInComparison = 1;
        }
      } else if (currentPageInComparison == 1){
        if (mouseX >= 100 - leftArrow.width / 2 && mouseX <= 100 + leftArrow.width / 2 && mouseY >= height / 2 - leftArrow.height / 2 && mouseY <= height / 2 + leftArrow.height / 2){
          currentPageInComparison = 0;
        }
      }
    } else if (currentRes == 2){
      for (int i = 0; i < 3; ++i){
        if (mouseX >= width / 2 - 300 + (2 * i + 1) * 100 - 90 && mouseX <= width / 2 - 300 + (2 * i + 1) * 100 + 90 && mouseY >= 125 && mouseY <= 175){
          type = i;
          break;
        }
      }
    }
    for (int i = 0; i < 3; ++i){
      if (mouseX >= width / 6 * (2 * i + 1) - 50 && mouseX <= width / 6 * (2 * i + 1) + 50 && mouseY >= height - 50 && mouseY <= height){
        currentRes = i;
        break;
      }
    }
  }
  if (mouseX >= 20 && mouseX <= 20 + back.width && mouseY >= 20 && mouseY <= back.height){
    if (currentPage == 1) currentPage = 0;
    else if (currentPage == 2) currentPage = 1;
  }
}

void Homepage(){
  imageMode(CENTER);
  image(bg, 1100, height / 2);
  
  textSize(28);
  fill(40, 40, 40);
  textAlign(CENTER);
  text("2014-2015秋季学期", 300, 300);
  text("上海交大闵行校区食堂报告", 300, 340);
  textSize(10);
  text("数据来源：交大人持校园一卡通在校园食堂内的消费记录", 300, 370);
  
  imageMode(CENTER);
  image(nextArrow, 300, 450);
}

//calculate data

void getGenderPortion(){
  int male = 0;
  int female = 0;
  for (TableRow row : data.rows()){
    String gender = row.getString("性别");
    if (gender.equals("男")){
      male += 1;
    } else if (gender.equals("女")){
      female += 1;
    }
  }
  genderPortions[0] = float((int((float(male) / (male + female)) * 10000))) / 10000;
  genderPortions[1] = float((int((float(female) / (male + female)) * 10000))) / 10000;
}

void getEducationPortion(){
  int bachelor = 0;
  int master = 0;
  int doctor = 0;
  for (TableRow row : data.rows()){
    String education = row.getString("学历");
    if (education.equals("本科")){
      bachelor += 1;
    } else if (education.equals("硕士")){
      master += 1;
    } else if (education.equals("博士")){
      doctor += 1;
    }
  }
  educationPortions[0] = float((round((float(bachelor) / (bachelor + master + doctor)) * 10000))) / 10000;
  educationPortions[1] = float((round((float(master) / (bachelor + master + doctor)) * 10000))) / 10000;
  educationPortions[2] = float((round((float(doctor) / (bachelor + master + doctor)) * 10000))) / 10000;
}

void getVolumnInMonths(){
  for (TableRow row : data.rows()){
    int monthIndex = row.getInt("月份") - 9;
    if (monthIndex == -8) monthIndex = 4;
    String canteen = row.getString("商户系统名称");
    if (canteen.equals("闵行第一食堂")){
      volumnInMonths[monthIndex][0] += row.getInt("交易额");
    } else if (canteen.equals("闵行第二食堂")){
      volumnInMonths[monthIndex][1] += row.getInt("交易额");
    } else if (canteen.equals("闵行第三食堂")){
      volumnInMonths[monthIndex][2] += row.getInt("交易额");
    } else if (canteen.equals("闵行第四食堂")){
      volumnInMonths[monthIndex][3] += row.getInt("交易额");
    } else if (canteen.equals("闵行第五食堂")){
      volumnInMonths[monthIndex][4] += row.getInt("交易额");
    } else if (canteen.equals("闵行第六食堂")){
      volumnInMonths[monthIndex][5] += row.getInt("交易额");
    } else if (canteen.equals("哈乐")){
      volumnInMonths[monthIndex][6] += row.getInt("交易额");
    }
  }
}

void getVolumnInTime(){
  for (TableRow row : data.rows()){
    int monthIndex = row.getInt("月份") - 9;
    if (monthIndex == -8) monthIndex = 4;
    String canteen = row.getString("商户系统名称");
    int time = row.getInt("时段");
    if (time < 4 || time > 20) continue;
    if (canteen.equals("闵行第一食堂")){
      volumnInTime[monthIndex][0][time - 4] += row.getInt("交易额");
    } else if (canteen.equals("闵行第二食堂")){
      volumnInTime[monthIndex][1][time - 4] += row.getInt("交易额");
    } else if (canteen.equals("闵行第三食堂")){
      volumnInTime[monthIndex][2][time - 4] += row.getInt("交易额");
    } else if (canteen.equals("闵行第四食堂")){
      volumnInTime[monthIndex][3][time - 4] += row.getInt("交易额");
    } else if (canteen.equals("闵行第五食堂")){
      volumnInTime[monthIndex][4][time - 4] += row.getInt("交易额");
    } else if (canteen.equals("闵行第六食堂")){
      volumnInTime[monthIndex][5][time - 4] += row.getInt("交易额");
    } else if (canteen.equals("哈乐")){
      volumnInTime[monthIndex][6][time - 4] += row.getInt("交易额");
    }
  }
}

void getVolumnAndTimesInPerson(){
  ArrayList<Integer> persons = new ArrayList<Integer>();
  ArrayList<Integer> volumns = new ArrayList<Integer>();
  ArrayList<Integer> times = new ArrayList<Integer>();
  for (TableRow row : data.rows()){
    int studentNumber = row.getInt("学号");
    int volumn = row.getInt("交易额");
    int pos = persons.indexOf(studentNumber);
    if (pos == -1){
      persons.add(studentNumber);
      volumns.add(volumn);
      times.add(1);
    }else{
      int oldVal = volumns.get(pos);
      volumns.set(pos, volumn + oldVal);
      int oldTimes = times.get(pos);
      times.set(pos, oldTimes + 1);
    }
  }
  ArrayList<Integer> selectedPersons = new ArrayList<Integer>();
  for (int i = 0; i < 198;){
    int randomVal = int(random(0, 198));
    int pos = selectedPersons.indexOf(persons.get(randomVal));
    if (pos == -1){
      volumnInPerson[i][0] = volumns.get(randomVal);
      volumnInPerson[i][1] = times.get(randomVal);
      volumnInPerson[i][2] = int(random(0, 13));
      selectedPersons.add(persons.get(randomVal));
      ++i;
    }
  }
}

void getStarInTime(){
  HashMap<String, Integer> timesIn7am = new HashMap<String, Integer>();
  HashMap<String, Integer> timesIn11am = new HashMap<String, Integer>();
  HashMap<String, Integer> timesIn17pm = new HashMap<String, Integer>();
  for (TableRow row : data.rows()){
    if (row.getString("商户系统名称").equals("闵行第二食堂")){
      int time = row.getInt("时段");
      String pos = row.getString("商户名称");
      if (time == 7){
        if (timesIn7am.containsKey(pos)){
          int oldVal = timesIn7am.get(pos);
          timesIn7am.put(pos, oldVal + 1);
        } else {
          timesIn7am.put(pos, 1);
        }
      } else if (time == 11){
        if (timesIn11am.containsKey(pos)){
          int oldVal = timesIn11am.get(pos);
          timesIn11am.put(pos, oldVal + 1);
        } else {
          timesIn11am.put(pos, 1);
        }
      } else if (time == 17){
        if (timesIn17pm.containsKey(pos)){
          int oldVal = timesIn17pm.get(pos);
          timesIn17pm.put(pos, oldVal + 1);
        } else {
          timesIn17pm.put(pos, 1);
        }
      }
    }
  }
  for (int i = 0; i < 3; ++i){
    int morningMax = -1;
    String morningMaxName = "";
    int noonMax = -1;
    String noonMaxName = "";
    int eveningMax = -1;
    String eveningMaxName = "";
    for (HashMap.Entry entry : timesIn7am.entrySet()) {
      if (int(entry.getValue().toString()) > morningMax){
        morningMax = int(entry.getValue().toString());
        morningMaxName = entry.getKey().toString();
      }
    }
    timesIn7am.remove(morningMaxName);
    for (HashMap.Entry entry : timesIn11am.entrySet()) {
      if (int(entry.getValue().toString()) > noonMax){
        noonMax = int(entry.getValue().toString());
        noonMaxName = entry.getKey().toString();
      }
    }
    timesIn11am.remove(noonMaxName);
    for (HashMap.Entry entry : timesIn17pm.entrySet()) {
      if (int(entry.getValue().toString()) > eveningMax){
        eveningMax = int(entry.getValue().toString());
        eveningMaxName = entry.getKey().toString();
      }
    }
    timesIn17pm.remove(eveningMaxName);
    topName[0][i] = morningMaxName;
    topName[1][i] = noonMaxName;
    topName[2][i] = eveningMaxName;
    topValue[0][i] = morningMax;
    topValue[1][i] = noonMax;
    topValue[2][i] = eveningMax;
  }
}