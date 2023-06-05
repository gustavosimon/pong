/** 
 * Classe principal que implementa efetivamente o jogo Pong.
 */
public class Game implements Screen {

  /** Pontuação máxima a ser atingida no jogo Pong */ 
  private final int MAX_SCORE = 5;

  /** Instância representando a bola do jogo Pong */
  private Ball ball;
  /** Booleano representando se o jogo foi finalizado */
  private boolean finishGame = false;

  /** Instância representando a barra esquerda do jogo Pong */
  private Paddle paddleLeft;
  /** Instância representando a barra direita do jogo Pong */
  private Paddle paddleRight;
  
  /** Pontuação do jogador 1 */
  private int p1Score = 0;
  /** Pontuação do jogador 2 */
  private int p2Score = 0;

  /**
   * Configura o jogo.
   */
  void gameSetup() {
    windowResize(800,480);
    ball = new Ball(width / 2, height / 2, 50); 
    ball.speedX = 5; 
    ball.speedY = random(-2,2);
    paddleLeft = new Paddle(15, height / 2, 30, 200);
    paddleRight = new Paddle(width - 15, height / 2, 30, 200);
  }

  /**
   * Desenha a janela do jogo.
   */
  void draw(){
    background(0);
    ball.display();
    ball.move();
    ball.display();
    
    paddleLeft.move();
    paddleLeft.display();
    paddleRight.move();
    paddleRight.display();
    
    if (ball.right() > width) {
      p1Score = p1Score + 1;
      ball.x = width / 2;
      ball.y = height / 2;
    }

    if (ball.left() < 0) {
      p2Score = p2Score + 1;
      ball.x = width / 2;
      ball.y = height / 2;
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
      paddleRight.y = height - paddleRight.h / 2;
    }

    if (paddleRight.top() < 0) {
      paddleRight.y = paddleRight.h / 2;
    }
    
    if(p2Score > MAX_SCORE || p1Score > MAX_SCORE) {
      finishGame = true;
      return;
    }

    if ( ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()){
      ball.speedX = -ball.speedX;
      ball.speedY = map(ball.y - paddleLeft.y, -paddleLeft.h / 2, paddleLeft.h / 2, -10, 10);
    }

    if ( ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
      ball.speedX = -ball.speedX;
      ball.speedY = map(ball.y - paddleRight.y, -paddleRight.h / 2, paddleRight.h / 2, -10, 10);
    }
  
    textSize(40);
    textAlign(CENTER);
    text(p2Score, width / 2 + 30, 30);
    text(p1Score, width / 2 - 30, 30);
  }

  /** 
   * Evento de precionar tecla do teclado.
   */
  public void keyPressed(){
    if(keyCode == UP){
      paddleRight.speedY = -3;
    }
    if(keyCode == DOWN){
      paddleRight.speedY = 3;
    }
    if(key == 'a'){
      paddleLeft.speedY = -3;
    }
    if(key == 'z'){
      paddleLeft.speedY = 3;
    }
  }

  /** 
   * Evento de soltar tecla do teclado.
   */
  public void keyReleased(){
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

  /** 
   * Retorna se finalizou o jogo.
   *
   * @return finishGame retorna {@code true} se e somente 
   *                    se finalizou o jogo.
   */
  public boolean isFinishGame() {
    return finishGame;
  }

  /** 
   * Evento de precionar botão do mouse. 
   */
  public void mousePressed() {
    return;
  }

  /** 
   * Retorna a pontuação do jogador 1.
   *
   * @return p1Score retorna a pontuação do jogador 1.
   */
  public int getPlayer1Score() {
    return p1Score;
  }

  /** 
   * Retorna a pontuação do jogador 2.
   *
   * @return p1Score retorna a pontuação do jogador 2.
   */
  public int getPlayer2Score() {
    return p2Score;
  }

  /** 
   * Classe representando a bola do jogo Pong.
   */ 
  private class Ball {
    
    private float x;
    private float y;
    private float speedX;
    private float speedY;
    private float diameter;
    private color c;
    
    Ball(float tempX, float tempY, float tempDiameter) {
      x = tempX;
      y = tempY;
      diameter = tempDiameter;
      speedX = 0;
      speedY = 0;
      c = (225); 
    }
    
    void move() {
      y = y + speedY;
      x = x + speedX;
    }
    
    void display() {
      fill(c);
      ellipse(x,y,diameter,diameter);
    }
    
    float left() {
      return x - diameter / 2;
    }

    float right() {
      return x + diameter / 2;
    }

    float top() {
      return y - diameter / 2;
    }

    float bottom() {
      return y + diameter / 2;
    }

  }

  /** 
   * Classe representando uma barra do jogo Pong.
   */ 
  private class Paddle {

    private float x;
    private float y;
    private float w;
    private float h;
    private float speedY;
    private float speedX;
    private color c;
    
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
      rect(x - w / 2, y - h / 2, w, h);
    } 
    
    float left() {
      return x - w / 2;
    }

    float right() {
      return x + w / 2;
    }

    float top() {
      return y - h / 2;
    }

    float bottom(){
      return y + h / 2;
    }

  }

}