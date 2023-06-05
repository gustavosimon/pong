/** Flag para indicar se já executou o setup do jogo */
private boolean setupGame = false;
/** Instância da janela atual */
private Screen currentScreen;

/** Instância da janela de Login */
private Login login = new Login();
/** Instância da janela principal com o jogo */
private Game game = new Game();

/** 
 * Configurações iniciais para a execução do jogo 
 */
public void setup() {
   size(400, 250);
   login.loginInit();
}

/** 
 * Desenha as janelas do jogo 
 */
public void draw() {

   // Aceita a tela de Login
   currentScreen = login;
   login.draw();
   if (!login.getPlayers()) {
      return;
   }

   // Aceita a tela do jogo Pong
   currentScreen = game;
   if (!setupGame) {
      game.gameSetup();
      setupGame = true;
   }
   game.draw();
   if (!game.isFinishGame()) {
      return;
   }

   // Instancia a janela com os resultados do jogo e aceita-a
   Result result = new Result(login.getPlayer1Name(), login.getPlayer2Name(), game.getPlayer1Score(), game.getPlayer2Score());

   currentScreen = result;
   result.draw();
}

/** 
 * Trata evento de botão do mouse pressionado.
 */
void mousePressed() {
   currentScreen.mousePressed();
}

/** 
 * Trata evento de botão do teclado pressionado.
 */
void keyPressed() {
   currentScreen.keyPressed();
}

/** 
 * Trata evento de botão do teclado solto.
 */
void keyReleased() {
   currentScreen.keyReleased();
}