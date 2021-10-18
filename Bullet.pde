class Bullet extends GameObject {
  int stroke;
  PVector nudge;
  boolean ally;

  //ally
  Bullet() {
    timer = 60;
    lives = 1;
    stroke = #FFFCFD;

    location = new PVector (myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    velocity.add(myShip.velocity);
    size = 20;
    ally = true;
  }

  //UFO bullet
  Bullet(float x, float y, float vx, float vy) {
    timer = 100;
    lives = 1;
    stroke=#FF0000;
    location = new PVector(x, y);
    velocity = new PVector (vx, vy);
    velocity.setMag(7);
    size = 10;
    ally = false;
  }

  void show() {
    stroke(stroke);
    noFill();

    //bullets
    if (ally) {
      image(Primogems, location.x, location.y, size, size);
    } else {
      ellipse(location.x, location.y, size, size);
    }
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
