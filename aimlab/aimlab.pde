int xPos;    
int speed=1;                  
int xDir=1;  
int score=0;                   
int lives=5;                   
boolean lost=false;            
PImage bg;
void setup()                   
{
  frameRate(150);
  bg = loadImage("latar.jpg");
  size (400,400);
  smooth();
  xPos=width/2;                
  fill(0,255,0);               
  textSize(13);                
}

void draw()                                     {
  background (bg);                               
  ellipse(xPos, height/2,40,40);                 
  xPos=xPos-(speed*xDir);                        
  if (xPos > height-20 || xPos<20)                
  {
    xDir=-xDir;                                  
  }
  text("score = "+score,10,10);                  //cetak score
  text("lives = "+lives,width-80,10);            //cetak nyawa
  if (lives<=0)                                  //kalau kalah =0
  {
    textSize(20);
    text("Click to Restart", 125,100);
    noLoop();                                    //Stop looping at the end of the draw function
    lost=true;
    textSize(13);
  }
}

void mousePressed()                              
{
  if (dist(mouseX, mouseY, xPos, 200)<=20)      
  {
    score=score+speed;                           
    speed=speed+1;                               
  }
  else                                           
  {
    if (speed<1)                                 
    {
    speed=speed-1;
    }
    lives=lives-1;                               
  }
  if (lost==true)                               
  {
    speed=1;                                     
    lives=5;
    score=0;
    xPos=width/2;
    xDir=1;
    lost=false;
    loop();                                     
  }
}
