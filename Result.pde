public class Result implements Screen {

    private final int MAX_SCORE = 5;
  
    private String p1Name;
    private String p2Name;
    private int p1Score;
    private int p2Score;

    public Result(String p1Name, String p2Name, int p1Score, int p2Score) {


        this.p1Score = p1Score;
        this.p2Score = p2Score;
        this.p1Name = p1Name;
        this.p2Name = p2Name;
    }

    void draw() {
        windowResize(400, 250);

        background(130, 230, 230);

        // LABELS
        fill(250, 250, 250);
        textSize(32);
        text("Result", 200, 60);

        textSize(45);
        if (p1Score > MAX_SCORE) {
            String p1Wins = "Player " + p1Name + " wins!";
            text(p1Wins, 200, 125);
        } else {
            String p2Wins = "Player " + p2Name + " wins!";
            text(p2Wins, 200, 125);
        }
    }

    /** Evento de soltar tecla do teclado */
    public void keyReleased() {
        return;
    }

    /** Evento de precionar tecla do teclado */
    public void keyPressed() {
        return;
    }

    /** Evento de precionar botão do mouse */
    public void mousePressed(){
        return;
    }

}