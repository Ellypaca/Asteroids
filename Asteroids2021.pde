boolean upkey, downkey, leftkey, rightkey, spacekey, skey, shiftkey;
Ship myShip;
ArrayList<GameObject> myObjects;

int mode;
int INTRO = 0;
int GAME = 1;
int GAMEOVER = 2;

void setup() {
  size(800, 600);
  imageMode(CENTER);
  rectMode(CENTER);

  myShip = new Ship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroids());
  myObjects.add(new Asteroids());
  myObjects.add(new Asteroids());
}

void draw() {
  mode = GAME;
  background(0);
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode =" + mode);
  }


  int i = 0;
  while (i<myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }
}

void keyPressed() {
  if (keyCode == UP) upkey = true; 
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == SHIFT) shiftkey = true;

  if (key == ' ') spacekey = true;
  if (key == 's') skey = true;
}

void keyReleased() {
  if (keyCode == UP) {
    upkey = false;
    myShip.velocity.x = myShip.velocity.x *0.9;
    myShip.velocity.y = myShip.velocity.y *0.9;
  }
  if (keyCode == DOWN) {
    downkey = false;
    myShip.velocity.x = myShip.velocity.x *0;
    myShip.velocity.y = myShip.velocity.y *0;
  }
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == SHIFT) shiftkey = false;

  if (key == ' ') spacekey = false;
  if (key == 's') skey = false;
}
