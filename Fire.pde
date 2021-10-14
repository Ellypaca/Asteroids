class Fire extends GameObject {
  PVector nudge;
  Fire() {
    lives = 1;
    size = 10;
    t = int(random(200, 255));
    location = new PVector (myShip.location.x, myShip.location.y);
    //location = myShip.location.copy();
    nudge =  myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(30);
    location.add (nudge);
    velocity = myShip.direction.copy();
    velocity.rotate(PI+ random(-0.5, 0.5));
    velocity.setMag(3);
  }

  void show() {
    noStroke();
    fill(255, 0, 0, t);
    square(location.x, location.y, size);
  }
  void act() {
    super.act();
    t = t - 5;
    if (t <=0) {
      lives = 0;
    }
  }
}
