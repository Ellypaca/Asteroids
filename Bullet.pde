class Bullet extends GameObject {

  //ally
  Bullet() {
    timer = 60;
    lives = 1;

    location = new PVector (myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    velocity.add(myShip.velocity);
    size = 10;
  }

  //UFO bullet
  Bullet(float x, float y, float vx, float vy) {
    timer = 60;
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector (vx, vy);
    velocity.setMag(7);
    size = 10;
  }

  void show() {
    stroke(255);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();

    timer--;

    if (timer==0) {
      lives = 0;
    }

    if (dist(location.x, location.y, myShip.location.x, myShip.location.y) <= size/2 + myShip.size/2) {
      if (myShip.invincible == false) {
        myShip.lives--;
        myShip.invincible = true;
      }
    }
  }
}
