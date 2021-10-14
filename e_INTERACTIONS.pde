
void keyPressed() {
  if (keyCode == UP) upkey = true; 
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == SHIFT) shiftkey = true;
  if (key == 'z') zkey = true;
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
  if (key == 'z') zkey = false;
  if (key == ' ') spacekey = false;
  if (key == 's') skey = false;
}