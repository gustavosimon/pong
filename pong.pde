boolean setupGame = false;

void setup() {
   size(400, 250);
   LoginInit();
}


// - Adaptar pra não conflitar as chamadas dos callbacks (keyPressed, keyReleased)
// - Criar array de telas

// - Cria a tela com os resultados por participante
// - Comparar o conteúdo do login com não vazio (validar que informou dados)

void draw() {
   // 
   drawLogin();
   if (!flg_players) {
      return;
   }
   //
   if (!setupGame) {
      gameSetup();
      setupGame = true;
   }
   
   // Enquanto o jogo não finalizar, desenha o jogo e retorna
   // Precisa ser assim pq o draw() deste 'main' fica em loop 
   while (!flg_GameFinished) {
      drawGame();
      return;
   }
   drawResult();
}
