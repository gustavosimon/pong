void drawResult() {
    windowResize(400, 250);

    background(130, 230, 230);

    // LABELS
    fill(250, 250, 250);
    textSize(32);
    text("Result", 200, 60);

    textSize(45);
    if (scoreEsq > maxScore) {
        text("Player 1 wins!", 200, 125);
    } else {
        text("Player 2 wins!", 200, 125);
    }

}