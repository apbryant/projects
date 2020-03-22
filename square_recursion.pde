

void setup(){
  background(255);
 size(700,700); 
}

void draw(){
  
 drawSquare(50, 350, 200, 255);
}

void drawSquare(float x, float y, float l, int c){
 rect(x, y, l, l); 
 fill(c);
 if(c == 0){
  c = 10; 
 }
 if(l > 1){
     println(c);
    drawSquare(x + (l * .75), y - (l * .25), l * .75, int(c*.9));
    
 } 
}
