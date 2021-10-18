void game() {
  achitimer++;
  if (achitimer >= 60){
  achiseconds++;
  achitimer=0;
  }

  fill(h, s, b);
  rect(width/2-5, height/2-5, width+10, height+10);

  UFOtimer++;
  if (UFOtimer == 900) {
    myUFO.lives = 3;
    myObjects.add(new UFO());

    UFOtimer = 0;
  }


  //important stuff
  int i = 0;
  while (i<myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      if ( !(myObj instanceof Bullet) && !(myObj instanceof Fire)  && !(myObj instanceof Particle)) {
        int n = int(random(40, 50));//total number of particles;
        int j = 0; //counter
        while ( j< n) {
          j++;
          myObjects.add(new Particle(myObj.location.x, myObj.location.y, myObj.velocity.x, myObj.velocity.y));
        }
      }
      myObjects.remove(i);
    } else {
      i++;
    }
  }




  //cheating
  //if (skey) myShip.velocity.setMag(0);
  //if (shiftkey) myShip.threshold = 3;    
  //if (shiftkey == false) myShip.threshold = 40 ;
  //if (akey) wowcongrats = true;


  //lives 
  textSize(50);
  fill(#DE4EAC);
  textFont(Dash);
  text("Lives:" + myShip.lives, 140, 100);

  //Pause Button
  stroke(255);
  fill(133, 52, 152, 80);
  if (dist(mouseX, mouseY, width-80, 80) < 40) {
    fill(162, 247, 120, 80);
  }
  circle(width-80, 80, 80);
  fill(255, 255, 255, 150);
  rect(width-70, 80, 10, 40);
  rect(width-90, 80, 10, 40);

  //teleport timer
  fill(#253D5D);
  rect(50, height-100, 30, 100);

  if (myShip.safeTimer >= 400) {
    fill(#20C42C);
  } else {
    fill(#C42020);
  }

  rect(50, height-50-Math.min(100, myShip.safeTimer/4.0)/2.0, 30, Math.min(100, myShip.safeTimer/4.0 )); //takes minimum of 2 numbers







  //println(totalAsteroids);
  if (totalAsteroids <= 0) {
    //win
    //int in =  myObjects.size()-1;
    //while (in>=0) {
    //  GameObject myObj = myObjects.get(in);
    //  myObj.lives = 0;
    //  myObjects.remove(in);
    //  in--;
    //}

    myObjects.clear();


    victory = true;
    mode = GAMEOVER;
  } else if (myShip.lives == 0) {
    //loss 

    //int in = myObjects.size()-1;
    //while (in>=0) {
    //  GameObject myObj = myObjects.get(in);
    //  myObj.lives = 0;
    //  myObjects.remove(in);

    //  in--;
    //}

    myObjects.clear();

    victory = false;
    mode = GAMEOVER;
  }
}
