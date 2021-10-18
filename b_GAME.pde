
void game() {
  fill(0);
  rect(width/2-5, height/2-5, width+10, height+10);


  textSize(50);
  fill(255);
  text("Lives:" + myShip.lives, 70, 100);

  UFOtimer++;
  if (UFOtimer == 900) {
    myUFO.lives = 3;
    println(UFOtimer);
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
  if (skey) myShip.velocity.setMag(0);
  if (shiftkey) myShip.threshold = 3;    
  if (shiftkey == false) myShip.threshold = 40 ;
  if (akey) myShip.invincible = true;






  //println(totalAsteroids);
  if (totalAsteroids <= 0) {
    //loss

    int in = 0;
    while (in<myObjects.size()) {
      GameObject myObj = myObjects.get(in);
      myObj.lives = 0;
      in++;
    }


    victory = false;
    mode = GAMEOVER;
  } else if (myShip.lives == 0) {
    //win 

    int in = 0;
    while (in<myObjects.size()) {
      GameObject myObj = myObjects.get(in);
      myObj.lives = 0;
      in++;
    }

    victory = true;
    mode = GAMEOVER;
  }
}
