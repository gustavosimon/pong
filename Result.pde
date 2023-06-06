/** 
 * Classe que exibe os resultados do jogo Pong.
 */
public class Result implements Screen {

    /** Pontuação máxima do jogo */
    private final int MAX_SCORE = 5;
  
    /** Nome do jogador 1 */
    private String p1Name;
    /** Nome do jogador 2 */
    private String p2Name;
    /** Pontuação do jogador 1 */
    private int p1Score;
    /** Pontuação do jogador 2 */
    private int p2Score;

    public Result(String p1Name, String p2Name, int p1Score, int p2Score) {
        this.p1Score = p1Score;
        this.p2Score = p2Score;
        this.p1Name = p1Name;
        this.p2Name = p2Name;
    }

    /** 
     * Desenha a tela com os resultados do jogo.
     */
    void draw() {
        windowResize(400, 250);
        background(130, 230, 230);
        fill(250, 250, 250);
        textSize(32);
        text("Result", 200, 60);
        textSize(45);
        if (p1Score == MAX_SCORE) {
            text("Player " + p1Name + " wins!", 200, 125);
            textSize(25);
            text("Score: " + MAX_SCORE, 200, 145);            
        } else {
            text("Player " + p2Name + " wins!", 200, 125);
            textSize(25);
            text("Score: " + MAX_SCORE, 200, 145);
        }
    }

    /** 
     * Evento de soltar tecla do teclado 
     */
    public void keyReleased() {
        return;
    }

    /** 
     * Evento de precionar tecla do teclado 
     */
    public void keyPressed() {
        return;
    }

    /** 
     * Evento de precionar botão do mouse 
     */
    public void mousePressed(){
        return;
    }

}