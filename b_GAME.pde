
void game() {
  fill(255);
  textSize(50);
  text("Lives:" + myShip.lives, 70, 100);

  
  

  //println(totalAsteroids);
  if (totalAsteroids <= 0) {
    //loss
    mode = GAMEOVER;
  } else if (myShip.lives == 0) {
    //win 
    mode = GAMEOVER;
  }
}
