class Clock {

  int x, y;
  float min, hou, Dmin, Dhou, t, Xmin, Xhou;
  int mode;

  //0.normal 1.settime 2.random 中文

  Clock(int x, int y) {
    this.x=x;
    this.y=y;
    this.mode=1;
    this.min=int(random(60));
    this.hou=int(random(12));
    Xmin=random(3);
    Xhou=random(0.03);
    Dmin=-10;
    Dhou=-10;
    
  }

  void drawClock() {
    strokeWeight(2);
    //noStroke();
    stroke(150);
    rect(x-w, y-w, w*2, w*2, 10);
    stroke(100);
     for(int i=0;i<12;i++)
     line(cos(TWO_PI*(i)/12- HALF_PI) * w*0.8 + x, sin(TWO_PI*(i)/12- HALF_PI) * w*0.8 + y, cos(TWO_PI*(i)/12- HALF_PI) * w*0.9 + x, sin(TWO_PI*(i)/12- HALF_PI) * w*0.9 + y);


  stroke(0);
    //    ellipse(x, y, 160, 160); 
  
//println(w+"--------");
    strokeCap(PROJECT);
    strokeWeight( 10 );



    switch(mode) {
      //normal
    case 0:
      {
        
         //strokeWeight( 1 );
        //line(x, y, cos( TWO_PI*second()/60- HALF_PI) * w*0.9 + x, sin(TWO_PI*second()/60- HALF_PI) * w*0.9 + y);
         strokeWeight( 10 );
        line(x, y, cos( TWO_PI*minute()/60- HALF_PI) * w*0.8 + x, sin(TWO_PI*minute()/60- HALF_PI) * w*0.8 + y);
        line(x, y, cos(TWO_PI*(hour()%12)/12- HALF_PI) * w*0.7 + x, sin(TWO_PI*(hour()%12)/12- HALF_PI) * w*0.7 + y);

        break;
      }
      //settime
    case 1:
      {
        //orz(:◎)≡
      boolean O,M,G;
      O=cop(hou,Dhou,12,0.1);
      M=cop(min,Dmin,60,Xmin*10);
      G=cop(min,Dmin,60,0.5);
      if(O&&t!=200)hou=Dhou;
      
        if ( O && (M||G) ) {
          hou=Dhou;
          min=Dmin;
          line(x, y, cos( TWO_PI*Dmin/60- HALF_PI) * w*0.8 + x, sin(TWO_PI*Dmin/60- HALF_PI) * w*0.8 + y);
          line(x, y, cos( TWO_PI*(Dhou%12)/12- HALF_PI) * w*0.7 + x, sin(TWO_PI*(Dhou%12)/12- HALF_PI) * w*0.7 + y);
//player.close();
//minim.stop();
//super.stop();
//          println(min+"@"+Dmin);
        }
        else {

          if (hou>12)hou=hou-12;
          if (min>60)min=min-60;

          hou=hou+Xhou;
          min=min+Xmin;
          //         hou=Dhou;
          // <-hou  min-> 
          line(x, y, cos( TWO_PI*min/60- HALF_PI) * w*0.8 + x, sin(TWO_PI*min/60- HALF_PI) * w*0.8 + y);
          line(x, y, cos( TWO_PI*(hou%12)/12- HALF_PI) * w*0.7 + x, sin(TWO_PI*(hou%12)/12- HALF_PI) * w*0.7 + y);
// println(min+"-"+Dmin+"-"+Xmin);
//          println(hou+"-"+Dhou+"-"+Xhou);
//          println( (int(( (hou+0.2) %12)*10+0.2)+"+"+int((Dhou%12)*10)) );




          break;
        }
      }
      //random
    case 2:
      {
        
        break;
      }
    }
  }

  void setTime(float Dhou, float Dmin, float t) {
    this.Dmin=Dmin;
    this.Dhou=Dhou;
    this.t=t;
    if (Dhou<hou)Dhou=Dhou+12;
    Xhou=(Dhou-hou)/t;
    if (Dmin<min)Dmin=Dmin+60;
    Xmin=(Dmin-min+int(Dhou-hou)*60)/t;
    //if(Xmin<0.01)Xmin=0.01;
    //if(Xhou<0.01)Xhou=0.01;
    // println(Xmin);
  }
}

