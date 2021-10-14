class Particle extends GameObject {



  Particle(float x, float y, float vx, float vy) {
    lives = 60;
    size = 5;
    t = int(random(200, 255));
    int i = 0;
    location = new PVector (x, y);
    velocity = new PVector (vx, vy);



    //while (i<7) {
    //  GameObject myObj = myObjects.get(i);
    //  location = new PVector (x, y);
    //}
  }

  void show() {
    noStroke();
    fill(255, 0, 0, t);
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();

    super.act();
    t = t - 5;
    if (t <=0) {
      lives = 0;
    }
  }
}
