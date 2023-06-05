public class Login implements Screen {

   ArrayList<TextBox> textboxes = new ArrayList<TextBox>();

   boolean players = false;

   void loginInit() {
      
      TextBox player1 = new TextBox();
      player1.X = 160;
      player1.Y = 103;
      player1.W = 200;
      player1.H = 35;
      
      TextBox player2 = new TextBox();
      player2.X = 160;
      player2.Y = 153;
      player2.W = 200;
      player2.H = 35;
      
      textboxes.add(player1);
      textboxes.add(player2);
   }

   void draw() {

      background(137, 12, 201);
      // LABELS
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

   void mousePressed() {
      for (TextBox t : textboxes) {
         t.PRESSED(mouseX, mouseY);
      }
   }

   void submit() {
      if (!textboxes.get(0).Text.equals("")) {
         if (!textboxes.get(1).Text.equals("")) {
            players = true;
         } else {
            players = false;
         }
      } else {
         flg_players = false;
      }
   }

   void keyPressed() {
      for (TextBox t : textboxes) {
         if (t.KEYPRESSED(key, (int)keyCode)) {
            submit();
         }
      }
   }

   public String getPlayer1Name() {
      return textboxes.get(0).Text;
   }

   public String getPlayer2Name() {
      return textboxes.get(1).Text;
   }

   void keyReleased() {
      return;
   }

   public boolean getPlayers() {
      return players;
   }
}