// Variáveis para utilização do menu
int X_retangulo, Y_retangulo; // Posição do botão quadrado
int X_circulo, Y_circulo;     // Posição do botão círculo
int rectSize = 90;     // Diâmetro do retângulo
int circleSize = 93;   // Diâmetro do retângulo
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

PShape pointer;

void setup() {
  // Sinalização em tela da criação da janela
  println("Criando janela menu principal");
  // Criação da janela principal
  size(300, 300, P2D);
  
  // Parâmetros do botão retangular
  // TODO: Criar própria função 'rect' e 'triangle'
  rectColor = color(0);
  rectHighlight = color(51);
  X_retangulo = width/2-rectSize-10;
  Y_retangulo = height/2-rectSize/2;

  // Parâmetros do botão circular
  circleColor = color(255);
  circleHighlight = color(204);
  X_circulo = width/2+circleSize/2+10;
  Y_circulo = height/2;

  ellipseMode(CENTER);  
  
  // Criação das formas na tela principal
  rect(X_retangulo, Y_retangulo, rectSize, rectSize);
  ellipse(X_circulo, Y_circulo, circleSize, circleSize);

  
  // Ponteiro centralizado no mouse, compartilhado entre as janelas
  pointer = createShape(ELLIPSE, 0, 0, 20, 20);

  // Muda localização da janela principal
  windowMove(0, 0);
}