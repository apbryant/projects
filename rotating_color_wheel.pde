// modified 2d transformation tutorial https://processing.org/tutorials/transform2d/ 
// to make the wheel rotate

void setup() {
  size(200, 200);
  background(255);
  smooth();
  noStroke();
  
  
}

void draw(){

  background(255);
  translate(100, 100);
  rotate(radians(frameCount   % 360));
  drawWheel();
  
}

void drawWheel(){
  for(int i = 0; i < 10000; i ++){
    if(i % 10 == 0){
        fill(i * 3 % 255, i * 5 % 255,
      i * 7 % 255);
    pushMatrix();

    rotate(radians(i * 2  % 360));
    rect(0, 0, 80, 20);
    popMatrix();
    }
     
  }
  
}
