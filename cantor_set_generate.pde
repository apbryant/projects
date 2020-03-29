ArrayList<CantorLine> lines;

class CantorLine{
 PVector start;
 PVector end;
 float len;
 float downShift = 20;
 
 CantorLine(PVector a, PVector b, float l) {
    this.start = a.copy();
    this.end = b.copy();
    this.len = l;
  }
  
  void display() {
    noFill();
    strokeWeight(3);
    line(this.start.x, this.start.y, this.end.x, this.end.y);
  }
  
  PVector cantorA(){
   PVector a = this.start.copy();
   println(a);
   a.add(new PVector(0, downShift));
   return a;
  }
  
  PVector cantorB(){
   PVector a = this.start.copy();
   
   a.add(new PVector(len /3, 0)); 
   a.add(new PVector(0, downShift));
   println(a);
   return a;
  }
  
  PVector cantorC(){
   PVector a = this.start.copy();
   a.add(new PVector(len * 2 / 3, 0)); 
   a.add(new PVector(0, downShift));
   return a;
  }
  
  PVector cantorD(){
   PVector a = this.end.copy();
   a.add(new PVector(0, downShift));
   return a;
  }
  
  
}

void generate() {
  ArrayList<CantorLine> next = new ArrayList<CantorLine>();
  for (CantorLine l : lines) {
 
if(l.len >= 1){
   PVector a = l.cantorA();
  
    
    PVector b = l.cantorB();
    PVector c = l.cantorC();
    PVector d = l.cantorD();

    CantorLine u = new CantorLine(a, b, l.len / 3);
    CantorLine v = new CantorLine(c, d, l.len / 3);
   println(l.len);

    next.add(u);
    next.add(v);
}
   

  }
  for(CantorLine l : next){
    lines.add(l);
  }

}
void cantor(float x, float y, float len) {

  if (len >= 1) {
    line(x,y,x+len,y);
    y += 20;
    cantor(x,y,len/3);
    cantor(x+len*2/3,y,len/3);
  }
}

void setup(){
  background(255);
  size(1200, 800);
 
  
  pushMatrix();
  translate(600, 0);
  rotate(radians(90));
  
   PVector start = new PVector(100, 100);
  PVector end = new PVector(700, 100);
  lines = new ArrayList<CantorLine>();
  lines.add(new CantorLine(start, end, end.x - start.x));

 for (int i = 0; i <4; i++) {
    generate();
    
  }
  for(CantorLine l : lines){

   l.display(); 
  }
  popMatrix();
  
   pushMatrix();
  translate(600, 800);
  rotate(radians(-90));
  
  start = new PVector(100, 100);
   end = new PVector(700, 100);
  lines = new ArrayList<CantorLine>();
  lines.add(new CantorLine(start, end, end.x - start.x));

 for (int i = 0; i <4; i++) {
    generate();
    
  }
  for(CantorLine l : lines){

   l.display(); 
  }
  popMatrix();
}

void draw(){
  
}
