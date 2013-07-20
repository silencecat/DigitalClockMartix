
       /*==/          i     i          \==_
     /XX/            |\___/|            \XX\
   /XXXX\            |XXXXX|            /XXXX\
  |XXXXXX\_         _XXXXXXX_         _/XXXXXX|
 XXXXXXXXXXXxxxxxxxXXXXXXXXXXXxxxxxxxXXXXXXXXXXX
|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|
 XXXXXX/^^^^"\XXXXXXXXXXXXXXXXXXXXX/^^^^^\XXXXXX
  |XXX|       \XXX/^^\XXXXX/^^\XXX/       |XXX|
    \XX\       \X/    \XXX/    \X/       /XX/
       "\       "      \X/      "      */
       

//Clock[] cl;
//Clock[] dl;
//int 
//import ddf.minim.*;AudioPlayer player;Minim minim;

  int w;
  DClock dc = new DClock();


float[][][] Font={ 
                 { {6,15},{6,0},{12,15},{6,45},{6,0},{12,45} },         //0
                 { {7.5,38},{7.5,38},{7.5,38},{6,30},{12,30},{12,0}},//1
                 { {3,15},{6,15},{12,15},{6,45},{12,45},{9,45}},//2
                 { {3,15},{3,15},{3,15},{6,45},{12,45},{12,45} },//3
                 { {6,30},{12,15},{7.5,38},{6,30},{12,45},{12,0} },//4
                 { {6,15},{12,15},{3,15},{9,45},{6,45},{12,45} },//5
                 { {6,15},{12,15},{3,0},{9,45},{6,45},{9,0} },//6
                 { {3,15},{7.5,38},{7.5,38},{6,45},{12,30},{12,0} },//7
                 { {6,15},{12,15},{12,15},{6,45},{12,45},{12,45} },//8
                 { {6,15},{12,15},{3,15},{6,45},{12,45},{12,45} },//9

                };
int count=-1;

void setup() {
frame.setResizable(true);
  w=60;

  size(1000,400);
  
//minim=new Minim(this);
//player=minim.loadFile("paipai.mp3",1024);

  //clock[0]=new Clock();
}

void draw() {

  background(255); 
  fill(250); 
  if(count==-1){dc.cl[13].drawClock();}else dc.drawClock();
}

void mouseClicked() {
//player.play();

switch(count) {
      //normal
    case -1:{break;}
    case 0:{dc.changeMode(1);break;}
    case 2:{dc.setDay();break;}
    case 1:{dc.setYear();break;}
    default :{ dc.setTime();count=0;}

  }
  count++;
}

boolean cop(float x,float y,int a,float b){

//  x=x%a;
//  y=y%a;
  
  return ( (x+b)>y )&&( (x-b<y) );


}
