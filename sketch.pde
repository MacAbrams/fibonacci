
 Lightning lightningBolt;



void setup() {
   size(500,700);
   frameRate(25);
    drawBackdrop(255);
    lightningBolt= new Lightning((float)Math.random()*500,0,20,20,10);
}
 int timeToNextBolt = (int)Math.random()*80;
 int drawLoopIncrementer=0;
 void draw() {
   drawBackdrop(50);
   if(drawLoopIncrementer>=timeToNextBolt){
     drawBackdrop(255);
     fill(255,255,255,10);
     rect(0,0,500,700);
     lightningBolt= new Lightning((float)Math.random()*500,0,10,20,10);
     timeToNextBolt+=(int)(Math.random()*30)+2;
   }
   drawLoopIncrementer++;
 }



 class Lightning{
   float lightningStartX,lightningStartY,dx,dy;
   int ran;
   Lightning[] nextgen;
   boolean isnext =true;
  
   public float sigmoid(double sigmoidInput){
     return (float)((1/(1+Math.pow(2.718,-(sigmoidInput*0.25))))*3);
   }

   Lightning(float ix1, float iy1, float idx, float idy, int numberOfSteps){
     if(numberOfSteps-1!=0){
       lightningStartX=ix1;
       lightningStartY=iy1;
       dx=idx;
       dy=idy;
       float rdx=dx;
       float rdy=dy;
       ran = (int)(1+Math.random()*numberOfSteps/2);
       nextgen = new Lightning[ran];
       for(int i=0;i<ran;i++){

         float ndx=(float)(Math.random()*2*rdx)-dx;
         float ndy=(float)(Math.random()*Math.abs(ndx*rdy/5));
         rdx-=ndx;
         rdy-=ndy;
         nextgen[i] = new Lightning(lightningStartX+dx,lightningStartY+dy,ndx,ndy,numberOfSteps-1);
         strokeWeight((int)sigmoid(Math.sqrt(dx*dx+dy*dy)));
         nextgen[i].show();
         isnext=false;
        
         if(lightningStartX+dx+ndx<350){
           isnext=true;
         }
        
       }
       if(numberOfSteps-1!=0){
          isnext=true;
       }
     }
   }
  
   void show(){
     stroke(255,255,0);
     line((int)lightningStartX,(int)lightningStartY,(int)(lightningStartX+dx),(int)(lightningStartY+dy));
   }
 }


 void drawBackdrop(int setAlphaChannel){
  noStroke();
  fill(50,30,125,setAlphaChannel); 
  rect(0,0,500,500);
  fill(155);
  stroke(155);
  for(int j=0;j<500;j+=10){
    //add random seed
    ellipse((int)(500*cos(j)),0,(int)((sin(j*0.5)*0.1+cos(j+20))*100),(int)((sin(j)*100)+cos(3*j)*50));
  } 
  fill(0,50,0,setAlphaChannel);
  noStroke();
  rect(0,500,500,200);
 }
