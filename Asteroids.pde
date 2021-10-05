class Asteroids extends GameObject {
  Asteroids() {
    lives = 6;
    location = new PVector (random(0, width), random (0, height));
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = 100;
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
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2) {
          myObj.lives = 0;
          lives = 0;
        }
      }
      i++;
    }
  }
}
