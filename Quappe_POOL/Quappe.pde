class Quappe {
  float circlex;
  float circley;
  float speedx = 0;
  float speedy = 0;
  float randomseed;

  Quappe(float a, float b) {
    circlex = a;
    circley = b;
  }

  void display() {
    fill(20, 20, 20);
    noStroke();
    circle(circlex, circley, 30);
  }

  void moveQuappe() {
    randomseed = random(-1, 1);
    if (randomseed >0.5) { 
      //if (true) {
      //speedx = speedx + map(noise(random(0, 5)), 0, 1, -1, 1);
      //speedy = speedy + map(noise(random(0, 5)), 0, 1, -1, 1);
      speedx = speedx + random(-1, 1);
      speedy = speedy + random(-1, 1);
    };

    //Set a moving-resist
    // speedx = speedx - 0.1*speedx*speedx;
    //speedy = speedx - 0.1*speedy*speedy;

    //Define the central point.
    circlex = circlex + speedx;
    circley = circley + speedy;
  }

  void speedLimit() {
    //speed limit
    if (speedx > 3||speedx <-3) { 
      speedx = 0.7*speedx;
    };
    if (speedy > 3||speedy <-3) { 
      speedy = 0.7*speedy;
    };
  }

  void edageCheck() {
    //set a limit to the pool.
    if (circlex > width-15||circlex <15) { 
      speedx = -1.5*speedx;
    };
    if (circley >height-15||circley <15) {
      speedy = -1.5*speedy;
    };
  }
  void fear(float fearRate) {
    speedx=speedx+fearRate/map(((mouseX-circlex)*-1), 0, width, 0, 100);
    speedy=speedy+fearRate/map(((mouseY-circley)*-1), 0, height, 0, 100);
  }
  void touch(Quappe other) {
    float d = dist(circlex, circley, other.circlex, other.circley);
    if (d< 30) {
      float ru = 30-d;
      circlex = circlex + 1.5*ru;
      circley = circley + 1.5*ru;
      //speedx = speedx*1.5;
      //other.speedx = other.speedx*1.5;
    }
  }
    void runway(Quappe other) {
    float d = dist(circlex, circley, other.circlex, other.circley);
    if (d < 30) {
      float ru = 30-d;
      if (circlex-other.circlex > 0) {
        circlex = circlex + ru;
      } else {
        circlex = circlex - ru;
      }

      if (circley-other.circley >0 ) {
        circley = circley+ru;
      } else {
        circley = circley - ru;
      }
    }
  }
}
