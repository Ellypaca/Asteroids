boolean upkey, downkey, leftkey, rightkey, spacekey, skey, shiftkey, zkey;
Ship myShip;
UFO myUFO;
//Asteroids myAsteroids;
int numAsteroids, totalAsteroids;
ArrayList<GameObject> myObjects;

int mode;
int INTRO = 0;
int GAME = 1;
int GAMEOVER = 2;

//images
PImage Childe, Primo;

void setup() {
  size(800, 600);
  imageMode(CENTER);
  rectMode(CENTER);

  //pictures

  //Game Objects
  myShip = new Ship();
  //myAsteroids = new Asteroids();
  myUFO = new UFO();

  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  int i = 0;

  numAsteroids = 4;
  while (i < numAsteroids) {
    myObjects.add(new Asteroids());
    i++;
  }
  totalAsteroids = numAsteroids+numAsteroids*2;

  myObjects.add(new UFO());

  //GAMEMODE
  mode = GAME;
}

void draw() {
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
