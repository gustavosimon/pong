/**
 * Interface com os métodos obrigatórios para a criação de uma tela.
 */
public interface Screen {

    /** Desenha a janela em tela */
    public void draw();
    /** Evento de soltar tecla do teclado */
    public void keyReleased();
    /** Evento de precionar tecla do teclado */
    public void keyPressed();
    /** Evento de precionar botão do mouse */
    public void mousePressed();

}