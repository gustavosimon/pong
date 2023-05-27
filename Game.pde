Ball ball; 
boolean flg_GameFinished = false;

Paddle paddleLeft;
Paddle paddleRight;

int maxScore = 5;
int scoreEsq = 0;
int scoreDir = 0;

public StringList login(){

  StringList players = new StringList();

  // USERNAME TEXTBOX
  // CONFIGURED USING THE GLOBAL VARS
  TEXTBOX player1 = new TEXTBOX();
  player1.X = 160;
  player1.Y = 103;
  player1.W = 200;
  player1.H = 35;

    // USERNAME TEXTBOX
  // CONFIGURED USING THE GLOBAL VARS
  TEXTBOX player2 = new TEXTBOX();
  player1.X = 160;
  player1.Y = 133;
  player1.W = 200;
  player1.H = 35;

  textboxes.add(player1);
  textboxes.add(player2);

  for (TEXTBOX t : textboxes) {
    t.DRAW();
  }
  players.append("player1");
  players.append("player2");

  print(players);

  return players;
}

void gameSetup(){
  // Window size
  windowResize(800,480);

  // Centered ball to start the game
  ball = new Ball(width/2, height/2, 50); 

  // Horizontal ball speed
  ball.speedX = 5; 
  // Vertical ball speedx
  ball.speedY = random(-2,2);
  
 
  paddleLeft = new Paddle(15, height/2, 30,200);
  paddleRight = new Paddle(width-15, height/2, 30,200);

}

void drawGame(){
  background(0); //clear canvas
  ball.display(); // Draw the ball to the window
  ball.move(); //calculate a new location for the ball
  ball.display(); // Draw the ball on the window
  
  paddleLeft.move();
  paddleLeft.display();
  paddleRight.move();
  paddleRight.display();

  
  if (ball.right() > width) {
    scoreEsq = scoreEsq + 1;
    ball.x = width/2;
    ball.y = height/2;
  }
  if (ball.left() < 0) {
    scoreDir = scoreDir + 1;
    ball.x = width/2;
    ball.y = height/2;
  }

  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }

  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }
  
  if (paddleLeft.bottom() > height) {
    paddleLeft.y = height-paddleLeft.h/2;
  }

  if (paddleLeft.top() < 0) {
    paddleLeft.y = paddleLeft.h/2;
  }
    
  if (paddleRight.bottom() > height) {
    paddleRight.y = height-paddleRight.h/2;
  }

  if (paddleRight.top() < 0) {
    paddleRight.y = paddleRight.h/2;
  }
  
  if(scoreDir == maxScore || scoreEsq == maxScore) {
    flg_GameFinished = true;
    return;
  }
  // If the ball gets behind the paddle 
  // AND if the ball is int he area of the paddle (between paddle top and bottom)
  // bounce the ball to other direction

  if ( ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()){
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleLeft.y, -paddleLeft.h/2, paddleLeft.h/2, -10, 10);
  }

  if ( ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleRight.y, -paddleRight.h/2, paddleRight.h/2, -10, 10);
  }
  
  
  textSize(40);
  textAlign(CENTER);
  text(scoreDir, width/2+30, 30); // Score lado direito
  text(scoreEsq, width/2-30, 30); // Score lado esquerdo
}

// void keyPressed(){
//   if(keyCode == UP){
//     paddleRight.speedY=-3;
//   }
//   if(keyCode == DOWN){
//     paddleRight.speedY=3;
//   }
//   if(key == 'a'){
//     paddleLeft.speedY=-3;
//   }
//   if(key == 'z'){
//     paddleLeft.speedY=3;
//   }
// }

void keyReleased(){
  if(keyCode == UP){
    paddleRight.speedY=0;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=0;
  }
  if(key == 'a'){
    paddleLeft.speedY=0;
  }
  if(key == 'z'){
    paddleLeft.speedY=0;
  }
}


class Ball {
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
  
  // Constructor method
  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    c = (225); 
  }
  
  void move() {
    // Add speed to location
    y = y + speedY;
    x = x + speedX;
  }
  
  void display() {
    fill(c); //set the drawing color
    ellipse(x,y,diameter,diameter); //draw a circle
  }
  
  //functions to help with collision detection
  float left(){
    return x-diameter/2;
  }
  float right(){
    return x+diameter/2;
  }
  float top(){
    return y-diameter/2;
  }
  float bottom(){
    return y+diameter/2;
  }

}

class Paddle{

  float x;
  float y;
  float w;
  float h;
  float speedY;
  float speedX;
  color c;
  
  Paddle(float tempX, float tempY, float tempW, float tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c=(255);
  }

  void move(){
    y += speedY;
    x += speedX;
  }

  void display(){
    fill(c);
    rect(x-w/2,y-h/2,w,h);
  } 
  
  //helper functions
  float left(){
    return x-w/2;
  }
  float right(){
    return x+w/2;
  }
  float top(){
    return y-h/2;
  }
  float bottom(){
    return y+h/2;
  }
}