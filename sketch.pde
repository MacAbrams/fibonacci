import zeus.pde;

Lightning bolt;



void setup() {
   size(500,700);
   frameRate(25);
   back(255);
   bolt= new Lightning((float)Math.random()*500,0,20,20,10);
}
int r = (int)Math.random()*80;
int i=0;
void draw() {
  back(50);
  if(i>=r){
    back(255);
    fill(255,255,255,10);
    rect(0,0,500,700);
    bolt= new Lightning((float)Math.random()*500,0,10,20,10);
    r+=(int)(Math.random()*30)+2;
  }
  i++;
}
