//Asteroids Project
//Katelynn Bai
//Oct. 17, 2021

boolean upkey, downkey, leftkey, rightkey, spacekey, skey, shiftkey, zkey, qkey, akey;
int UFOtimer;
boolean victory;

Ship myShip;
UFO myUFO;
Asteroids myAsteroids;
int numAsteroids, totalAsteroids;
ArrayList<GameObject> myObjects;

int mode;
int INTRO = 0;
int GAME = 1;
int PAUSE = 2;
int GAMEOVER = 3;

//VISUALS===================
PImage Childe, Primogems;
PImage [] introGif;
int gifFrames; 
int f;
int h, s, b;
int timer;

//fonts
PFont NoSurrender, Dash;

//achivements
int achitimer, achiseconds;


void setup() {
  size(800, 600);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);

  //pictures
  Childe = loadImage("Tartar.png");
  Primogems = loadImage("Primo.png");


  //gif
  int n = 0;
  gifFrames = 117;
  introGif = new PImage [gifFrames];
  while (n < gifFrames) {
    introGif[n] = loadImage("frame_"+n+"_delay-0.07s.gif"); 
    n++;
  }


  //font
  NoSurrender = createFont("No Surrender.ttf", 100);
  Dash = createFont("Dash-Horizon-Demo.otf", 70);



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


  totalAsteroids = numAsteroids*3;
  myObjects.add(myUFO);

  //achievements





  //GAMEMODE
  mode = INTRO;
}

void draw() {
  background(0);
  if (mode == INTRO) {
    intro();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode =" + mode);
  }
}
