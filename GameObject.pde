class GameObject {
  int lives;
  PVector location;
  PVector velocity; 
  int size;

  GameObject() {
  }

  void show() {
  }

  void act() {
    location.add(velocity);

    //if (upkey) velocity.add(direction);
    //if (downkey) velocity.sub(direction);
    //if (leftkey) direction.rotate(- radians (5));
    //if (rightkey) direction.rotate(radians (5));
    //if (spacekey) myBullets.add(new Bullet());

    if ( location.y < -50) location.y = height + 50;
    if ( location.y > height + 50) location.y = -50;
    if ( location.x < -50) location.x = width + 50;
    if ( location.x > width + 50) location.x = -50;
  }
}
