/**
 * Classe de login do jogo Pong.
 */
public class Login implements Screen {

   /** Lista com as Text Boxes aceitas na janela de Login */
   private ArrayList<TextBox> textboxes = new ArrayList<TextBox>();
   /** Retorna se o jogo possui jogadores preenchidos */
   boolean players = false;

   /**
    * Configurações inicias da tela de Login. 
    */
   void loginInit() {
      
      // Cria a Text Box para informar o nome do jogador 1
      TextBox player1 = new TextBox();
      player1.X = 160;
      player1.Y = 103;
      player1.W = 200;
      player1.H = 35;
      
      // Cria a Text Box para informar o nome do jogador 2
      TextBox player2 = new TextBox();
      player2.X = 160;
      player2.Y = 153;
      player2.W = 200;
      player2.H = 35;
      
      // Adiciona as Text Boxes à lista para que possam ser exibidas na tela 
      // e para que seja possível recuperar os dados dos jogadores posteriormente
      textboxes.add(player1);
      textboxes.add(player2);
   }

   /**
    * Desenha a tela de Login.
    */
   void draw() {
      background(137, 12, 201);
      fill(250, 250, 250);
      text("Pong", (width - textWidth("Pong")) / 2, 60);
      textSize(15);
      text("Press Enter to Play", (width - textWidth("Press Enter to Play")) / 2, 80);
      textSize(24);
      text("Player 1: ", 20, 130);
      text("Player 2: ", 20, 180);
      for (TextBox t : textboxes) {
         t.DRAW();
      }
   }

   /** 
    * Evento de precionar botão do mouse. 
    */
   public void mousePressed() {
      for (TextBox t : textboxes) {
         t.PRESSED(mouseX, mouseY);
      }
   }

   /** 
    * Evento de precionar tecla do teclado.
    */
   public void keyPressed() {
      for (TextBox t : textboxes) {
         if (t.KEYPRESSED(key, (int)keyCode)) {
            submit();
         }
      }
   }

   /** 
    * Retorna o nome do jogador 1.
    * 
    * @return nome do jogador 1 
    */
   public String getPlayer1Name() {
      return textboxes.get(0).Text;
   }

   /** 
    * Retorna o nome do jogador 2.
    * 
    * @return nome do jogador 2
    */
   public String getPlayer2Name() {
      return textboxes.get(1).Text;
   }

   /** 
    * Evento de soltar tecla do teclado.
    */
   void keyReleased() {
      return;
   }

   /** 
    * Retorna se o nome dos jogadores já foram preenchidos.
    */
   public boolean getPlayers() {
      return players;
   }

   private void submit() {
      if (!textboxes.get(0).Text.equals("") && !textboxes.get(1).Text.equals("")) {
         players = true;
      } else {
         players = false;
      }
   }

}