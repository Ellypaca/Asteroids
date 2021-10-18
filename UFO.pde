class UFO extends GameObject {
  int x;

  UFO() {
    lives = 3;
    size = 100;
    shotTimer = 0;
    threshold = 100;
    int i = int( random(0, 2));
    if (i == 0) {
      x = -50 ;
    } else {
      x = 850;
    }

    location = new PVector (x, random (32, height-32));

    if (i == 1) {
      velocity = new PVector (1, 0);
    } else {
      velocity = new PVector (-1, 0);
    }
  }

  void show() {
    fill(#CBCBCB);
    ellipse(location.x, location.y, size, size - 40);
  }

  void act() {
    super.act();


    //shooting 
    shotTimer++;
    if (shotTimer >= threshold) {
      myObjects.add(new Bullet(location.x, location.y, myShip.location.x-location.x, myShip.location.y-location.y));
      shotTimer = 0;
    }

    //myShip.location.x-location.x
    //myShip.location.y-location.y




    //interactions
    int i = 0;
    while (i<myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet ) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2 && shotTimer >= 10) {
          myObj.lives--;
          lives--;
          // myObjects.add(new Particle());
        }

        //if (myObj instanceof Ship) {
        //  if (dist(location.x, location.y, myShip.location.x, myShip.location.y) <= size/2 + myShip.size/2) {
        //    if (myShip.invincible == false) {
        //      myShip.lives--;
        //      myShip.invincible = true;
        //      println("a");
        //    }
        //  }
        //}
      }
      i++;
    }
  }
}
