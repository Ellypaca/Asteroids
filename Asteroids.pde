class Asteroids extends GameObject {

  Asteroids() {
    lives = 1;
    numberlives = 2;
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
    noFill();
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();
    
      int i = 0;
    while (i<myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2 ) {
          myObj.lives--;
          lives--;
          numberlives--;
          totalAsteroids--;
          int n = int(random(10, 16));
          myObjects.add(new Particle(location.x, location.y, velocity.x, velocity.y));
          if (numberlives > 0 ) {
            myObjects.add(new Asteroids(size/2, location.x, location.y));
            myObjects.add(new Asteroids(size/2, location.x, location.y));
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
