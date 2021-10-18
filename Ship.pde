class Ship extends GameObject {
  //1. Instance Variables
  PVector direction;
  color[] colour;
  color gold = #EAC739;
  color black = #000000;
  int rColor;

  boolean invincible;
  int safeTimer;

  //2. Constructors
  Ship() {    
    timer = 60;
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 40;
    safeTimer = 400;

    colour = new color [2];
    colour[0] = gold;
    colour[1] = black;
    
    rColor = 1;
  }

  //3. Behaviour Functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    stroke(255);
    fill(colour[rColor]);
    triangle(-25, -12.5, -25, 12.5, 25, 0);





    popMatrix();
  }


  void act() {
    //====================
    super.act();

    //BUFFS========================
    if (invincible) {
      rColor = 0;
      if (timer == 0) {
        timer = 60;
        rColor = 1;
        invincible = false;
      }
      // println(timer);
      timer--;
    }






    //limit the maximum speed
    if (velocity.mag()>5) velocity.setMag(5);



    //up direction movement
    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    } 


    //down direction movement
    if (downkey) {
      velocity.sub(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    } 

    //remove if wanted, i think the constant velocity is kinda annoying
    if (downkey == false && upkey == false) {
      myShip.velocity.x = myShip.velocity.x *0.95;
      myShip.velocity.y = myShip.velocity.y *0.95;
    }

    //rotation commands
    if (leftkey) direction.rotate( radians (5));
    if (rightkey) direction.rotate(-radians (5));

    //shooting=================================================
    //counts down shot timer to limit rate of fire
    shotTimer++;
    if (spacekey && shotTimer >= threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;

      //add i-frame to increase skill cap
      invincible = true;
      timer = 5;
    }

    //safe point
    safeTimer++;
    if (zkey == true && myShip.safeTimer >= 400) {
      myShip.location.x = random(0+myShip.size, width-myShip.size);
      myShip.location.y = random(0+myShip.size, height-myShip.size);

      float tempx, tempy;
      while (true) { //infinite loop
        boolean bad = false;

        tempx = random(0+myShip.size, width-myShip.size);
        tempy = random(0+myShip.size, height-myShip.size);
        for (GameObject myObj : myObjects) {     //for every game object in "myObjects", loop over  
          if (myObj instanceof Asteroids) {
            if (dist(tempx, tempy, myObj.location.x, myObj.location.y) <= 200) {
              bad = true;
            }
          }
        }

        if (bad == false) {
          break;     //exits infinite loop
        }
      } 

      myShip.location.x = tempx;
      myShip.location.y = tempy;
      safeTimer = 0;
    }
  }
}
