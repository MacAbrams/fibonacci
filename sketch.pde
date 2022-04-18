import java.math.*;


ArrayList<Byte> pascal=new ArrayList<Byte>();
int myWidth=800;
int myHeight=800;
void setup(){
  size(800,800);
  fill(255,0,0);
  colorMode(RGB,1,1,1);
}
int m=0;
void draw(){

//  if(frameCount%1==0){
     background(0);
  stroke(1);
  strokeWeight(3);
  line(0,myHeight,myWidth,myHeight);
  line(myWidth,0,myWidth,myHeight);
  noStroke();
  for(int h=0;h<=m;h++){
    pascal.add(     ((Integer)(pcr(m,h)%2)).byteValue()       );
  }
  int c=0;
  for(int i=0;i<=m;i++){
    for(int j=0;j<=i;j++){
      fill(pascal.get(c));
      if(i%2==(m+1)%2)
       rect(((m-i)/2+j+0.5)*myWidth/(m+2), i*myHeight/(m+2) , myWidth/(m+2), myHeight/(m+2)  );
      else{
        rect( ((m-i)/2+j)*myWidth/(m+2), i*myHeight/(m+2) , myWidth/(m+2), myHeight/(m+2)  );
      }
      c++;
  
   }
  }
    m++;
  }
//}

public static int pcr(int p, int c){  
  return factorial(p).divide(factorial(c).multiply(factorial(p-c))).intValue();
}

public static BigInteger factorial(int n){
  BigInteger a=BigInteger.valueOf(1);
  for(int i=1;i<=n;i++){
    a=a.multiply(BigInteger.valueOf(i));
    
  }
  
  return a;
}
