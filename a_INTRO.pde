void intro() {
  //background(0);
  image(introGif[f], width/2, height/2, width, height);
  f++;
  if (f == gifFrames) f = 0;

  fill(0);
  textSize(50);
  text("Asteroids", width/2, 200);

  int i = 0;
  while (i<myObjects.size()) {
    i++;
  }
  myShip.lives = 3;
  myUFO.lives = 3;
  numAsteroids = 4;
}
