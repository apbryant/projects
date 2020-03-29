void setup() {
  size(1000, 1000);
 

}
int rectWidth = 30;
int rectLength = 100;
int diameter = 700;
void drawHourMarkers() {
  
  //1:00;
  pushMatrix();
  translate((500+175), (500-303.1));
  rotate(radians(30));
  
  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  //fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
    
  //2:00
  pushMatrix();
  translate(803.1, (500-175));
  rotate(radians(60));
    
  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  //fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
  //3:00
  pushMatrix();
  translate(850, 500);
  rotate(radians(90));
 
  fill(255);
  rect(-rectWidth/2,-rectLength/2, rectWidth, rectLength);
  //fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();

  //4:00
  pushMatrix();
  translate(803.1, (500+175));
  rotate(radians(120));

  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  //    fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
  //5:00
  pushMatrix();
  translate((500+175), (500+303.1));
  rotate(radians(150));
   
  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  // fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
  //6:00
  pushMatrix();
  translate(500, 850);
  rotate(radians(180));
    
  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  //fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
  //7:00
  pushMatrix();
  translate((500-175), (500+303.1));
  rotate(radians(210));
 
  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  //   fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
   //8:00
  pushMatrix();
  translate(500-303.1, (500+175));
  rotate(radians(240));
   
  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  // fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
  //9:00
  pushMatrix();
  translate(500-350, 500);
  rotate(radians(270));
    
  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  //fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
  //10:00
  pushMatrix();
  translate(500-303.1, (500-175));
  rotate(radians(300));
    
  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  //fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
  //11:00;
  pushMatrix();
  translate((500-175), (500-303.1));
  rotate(radians(330));
   
  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  // fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
  //12:00
  pushMatrix();
  translate((500), (500-350));
    
  fill(255);
  rect(-rectWidth/2, -rectLength/2, rectWidth, rectLength);
  //fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
}
void draw() {
   background(0);
  noFill();
  stroke(255);
  //noStroke();
  //ellipse(width/2, height/2, diameter, diameter);
  fill(255);
  noStroke();
  drawHourMarkers();
  // hour hand
  pushMatrix();
  translate(500, 500);
  rotate(radians(frameCount * 4));
  fill(255);
  rect(-rectWidth/2, 0, rectWidth, rectLength * 3.5);
  //fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  fill(255);
  popMatrix();
  
  //minute hand
   pushMatrix();
  translate(500, 500);
  rotate(radians(frameCount / 15));
  rect(-rectWidth/2, 0, rectWidth, rectLength * 2.5);
  // fill(255, 0, 0);
  //ellipse(0, 0, 5, 5);
  fill(255);
 
  popMatrix();
}
