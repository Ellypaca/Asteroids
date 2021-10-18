void intro() {
  //background(0);
  frameRate(16);
  image(introGif[f], width/2, height/2, width, height);
  f++;
  if (f == gifFrames) f = 0;


  textFont(NoSurrender);
  fill(0);
  text("Asteroids", width/2+4, 200+4);
  fill(90);
  text("Asteroids", width/2, 200);

  textFont(Dash);
  fill(20);
  text("Click anywhere to begin!", width/2, 500);


 
}
