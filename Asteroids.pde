class Asteroids extends GameObject {

  Asteroids() {
    numberlives = 2;
    lives = 1;
    location = new PVector (random(0, width), random (0, height));
    while (location.x >= 300 && location.x <= 500) {
      location = new PVector (random(0, width), random (0, height));
    }
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = 100;
  }

  Asteroids(int s, float x, float y) {
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = s;
  }

  void show() {
    fill(255);
    stroke(255);
    ellipse(location.x, location.y, size, size);

    //childe
    image(Childe, location.x, location.y, size, size);
  }

  void act() {
    super.act();
    timer++;




    int i = 0;
    while (i<myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2 ) {

          
          myObj.lives--;
          lives--;
          numberlives--;
          totalAsteroids--;

          


          //  (numberlives > 0 ) {
          //  myObjects.add(new Asteroids(size/2, location.x, location.y));
          //  myObjects.add(new Asteroids(size/2, location.x, location.y));
          //}

          switch (numberlives) {
          case 1:
            myObjects.add(new Asteroids(size/2, location.x, location.y));
            myObjects.add(new Asteroids(size/2, location.x, location.y));
            break;

          case 0:
            myObjects.add(new Asteroids(size/2, location.x, location.y));
            myObjects.add(new Asteroids(size/2, location.x, location.y));
            break;
          }
        }
      }

      if (myObj instanceof Ship) {
        if (dist(location.x, location.y, myShip.location.x, myShip.location.y) <= size/2 + myShip.size/2) {
          if (myShip.invincible == false) {
            myShip.lives--;
            myShip.invincible = true;
          }
        }
      }


      i++;
    }
  }
}
