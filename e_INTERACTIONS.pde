void mousePressed() {
  if (mode == INTRO) {
    frameRate(60);

    mode = GAME;
  } else if (mode == GAME) {
    if (dist(mouseX, mouseY, width-80, 80) < 40) {
      mode = PAUSE;
    }
  } else if (mode == PAUSE) {
    mode = GAME;
  } else if (mode == GAMEOVER) {

    //RESET
    println(myObjects.size());   
    myShip = new Ship();
    myObjects.add(myShip);

    timer = 0;

    int i = 0;
    numAsteroids = 4;
    while (i < numAsteroids) {
      myObjects.add(new Asteroids());
      i++;
    }

    UFOtimer = 0;
    myObjects.add(new UFO());
    achitimer = 0;
    achiseconds = 0;



    mode = INTRO;
  }
}


void keyPressed() {
  if (keyCode == UP) upkey = true; 
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  //if (keyCode == SHIFT) shiftkey = true;
  if (key == 'a') akey = true;
  if (key == 'z') zkey = true;
  if (key == ' ') spacekey = true;
  if (key == 's') skey = true;
  if (key == 'q') qkey = true;
  if (key == 'a') akey = true;
}

void keyReleased() {
  if (keyCode == UP) {
    upkey = false;
    myShip.velocity.x = myShip.velocity.x *0.9;
    myShip.velocity.y = myShip.velocity.y *0.9;
  }
  if (keyCode == DOWN) {
    downkey = false;
    myShip.velocity.x = myShip.velocity.x *0;
    myShip.velocity.y = myShip.velocity.y *0;
  }
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  //if (keyCode == SHIFT) shiftkey = false;
  if (key == 'z') zkey = false;
  if (key == ' ') spacekey = false;
  if (key == 's') skey = false;
  if (key == 'q') qkey = false;
  //if (key == 'a') akey = false;
}
