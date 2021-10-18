void pause() {
  //Anventia helped me with this
  int i = 0;
  while (i<myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    i++;
  }

  fill(35, 214, 209, 50);
  rect(width/2, height/2, width+5, height+5);
  textFont(Dash);
  fill(#D53FD8);
  text("Game Paused", width/2, 200);
  fill(#794EDE);
  text("Game Paused", width/2, 200);

  fill(#634EDE);
  text("Click anywhere to resume", width/2, 500);


  fill(#253D5D);
  stroke(255);
  rect(50, height-100, 30, 100);
}
