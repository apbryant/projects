class Ellipse{
 int x;
 int y;
 int l;
 int h;
 int r;
 int g;
 int b;
 Ellipse(int xPos, int yPos, int len, int ht){
   x=xPos;
   y=yPos;
   l=len;
   h=ht;
   r = 0;
   g = 0;
   b = 0;
 }
 
 void display(){
   fill(r, g, b);
   noStroke();
   ellipse(x, y, l, h);
 }
 
 void setColor(int red, int green, int blue){
   r=red;
   g=green;
   b=blue;
 }
}

ArrayList<Ellipse> list;
void setup(){
 size(1000, 1000);
 list = new ArrayList<Ellipse>();
  background(#eeeeee);
 fill(0);
 noStroke();
 for(int x = 0; x < 20; x++){
   for(int y = 0; y < 20; y++){
     Ellipse e = new Ellipse(x * 40 + 20, y * 40 + 20, 40, 40);
     list.add(e);
     e.display();
   }
 } 
}

void draw(){
 if(frameCount % 30 == 0){
   for(Ellipse el : list){
      el.setColor(int(random(255)), int(random(255)), int(random(255))); 
      el.display();
   }
 }
}
