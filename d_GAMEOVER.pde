void gameover() {
  background(80, 80, 80);


  //achivements
  textSize(30);
  textFont(Dash);
  text("Time taken:  "+achiseconds+" seconds", width/2, 350);
  textSize(80);

  textFont(NoSurrender);
  if (victory == true) {
    fill(#F5D159);
    text("You Won!", width/2, 200);
  } else {
    fill(0);

    text("You Lost...", width/2, 200);
  }

  textFont(Dash);
  text("Click anywhere to continue", width/2, 500);
}
