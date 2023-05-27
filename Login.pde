ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

boolean flg_players = false;

void LoginInit() {
   
   TEXTBOX player1 = new TEXTBOX();
   player1.X = 160;
   player1.Y = 103;
   player1.W = 200;
   player1.H = 35;
   
   TEXTBOX player2 = new TEXTBOX();
   player2.X = 160;
   player2.Y = 153;
   player2.W = 200;
   player2.H = 35;
   
   textboxes.add(player1);
   textboxes.add(player2);
}

void drawLogin() {

    background(137, 12, 201);
    // LABELS
    fill(250, 250, 250);
    text("Pong", (width - textWidth("Pong")) / 2, 60);
    textSize(15);
    text("Press Enter to Play", (width - textWidth("Press Enter to Play")) / 2, 80);
    textSize(24);
    text("Player 1: ", 20, 130);
    text("Player 2: ", 20, 180);
    
    for (TEXTBOX t : textboxes) {
        t.DRAW();
    }
   
}

void mousePressed() {
   for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
   }
}

void submit() {
   if (textboxes.get(0).Text.equals("lemmert")) {
      if (textboxes.get(1).Text.equals("simon")) {
         flg_players = true;
      } else {
         flg_players = false;
      }
   } else {
      flg_players = false;
   }
}

void keyPressed() {
   for (TEXTBOX t : textboxes) {
      if (t.KEYPRESSED(key, (int)keyCode)) {
         submit();
      }
   }
}