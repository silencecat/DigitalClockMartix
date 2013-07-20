class DClock {
  int x, y;
  float min, hou;
  int mode;
  Clock[] cl= new Clock[24];
  int w;

  DClock() {
    w=60;
    mode=0;
    for (int j=0;j<4;j++) {
      for (int i=0;i<3;i++) {
        cl[i+j*6]=new Clock(10+w+4*(w)*j, 10+w+2*(w)*i);
        cl[i+3+j*6]=new Clock(10+w*3+4*(w)*j, 10+w+2*(w)*i);
        // println(w);
      }
    }
  }
  void drawClock() {
    switch(mode) {
      //normal
    case 0:
      {
        for (int i=0;i<24;i++) {
          cl[i].drawClock();
        }
        break;
      }
    case 1:
      {


        for (int i=0;i<6;i++) {
          cl[i].setTime(Font[ int(hour()/10) ][i][0], Font[ int(hour()/10) ][i][1], 200);
          cl[i+6].setTime(Font[ int(hour()%10) ][i][0], Font[ int(hour()%10) ][i][1], 200);
          cl[i+12].setTime(Font[ int(minute()/10) ][i][0], Font[ int(minute()/10) ][i][1], 200);
          cl[i+18].setTime(Font[ int(minute()%10) ][i][0], Font[ int(minute()%10) ][i][1], 200);
        }
        //println(mode);

        for (int i=0;i<24;i++) {
          cl[i].drawClock();
        }

        break;
      }
    case 2:
      {
        for (int i=0;i<24;i++) {
          cl[i].drawClock();
        }
        if(this.min!=minute())this.mode=1;
        break;
      }
    }
  }
  void setDay() {
    for (int i=0;i<6;i++) {
      cl[i].setTime(Font[ int(month()/10) ][i][0], Font[ int(month()/10) ][i][1], 300);
      cl[i+6].setTime(Font[ int(month()%10) ][i][0], Font[ int(month()%10) ][i][1], 300);
      cl[i+12].setTime(Font[ int(day()/10) ][i][0], Font[ int(day()/10) ][i][1], 300);
      cl[i+18].setTime(Font[ int(day()%10) ][i][0], Font[ int(day()%10) ][i][1], 300);
    }
    
    this.mode=0;
  }
  void setYear() {
    for (int i=0;i<6;i++) {
      cl[i].setTime(Font[ int(year()/1000) ][i][0], Font[ int(year()/1000) ][i][1], 300);
      cl[i+6].setTime(Font[ int(year()%10/100) ][i][0], Font[ int(year()%10/100) ][i][1], 300);
      cl[i+12].setTime(Font[ int(year()/10%10) ][i][0], Font[ int(year()/10%10) ][i][1], 300);
      cl[i+18].setTime(Font[ int(year()%10) ][i][0], Font[ int(year()%10) ][i][1], 300);
    }
    
    this.mode=0;
  }
  void setTime() {
    for (int i=0;i<6;i++) {
      cl[i].setTime(Font[ int(hour()/10) ][i][0], Font[ int(hour()/10) ][i][1], 300);
      cl[i+6].setTime(Font[ int(hour()%10) ][i][0], Font[ int(hour()%10) ][i][1], 300);
      cl[i+12].setTime(Font[ int(minute()/10) ][i][0], Font[ int(minute()/10) ][i][1], 300);
      cl[i+18].setTime(Font[ int(minute()%10) ][i][0], Font[ int(minute()%10) ][i][1], 300);
    }
    this.min=minute();
    this.mode=2;
  }



  void changeMode(int mode) {
    for (int i=0;i<24;i++) {
      cl[i].mode=mode;
    }
    this.mode=mode;
  }


  void plus() {

    if (mouseButton == LEFT) {
      if (count>9)count=0;
      if (count<0)count=9;
      for (int i=0;i<6;i++) {
        cl[i].mode=1;
        cl[i].setTime(Font[count][i][0], Font[count][i][1], 200);
      }
      count++;
    }
    else {
      if (count>9)count=0;
      if (count<0)count=9;
      for (int i=0;i<6;i++) {
        cl[i].mode=1;
        cl[i].setTime(Font[count][i][0], Font[count][i][1], 50);
      }
      count--;
    }
  }
}

