boolean setupGame = false;

void setup() {
   size(400, 250);
   LoginInit();
}

void draw() {
   drawLogin();
   if (!players) {
      return;
   }
   if (!setupGame) {
      gameSetup();
      setupGame = true;
   }
   drawGame();
}
