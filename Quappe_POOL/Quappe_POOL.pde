int Q = 20; //Q is for the number of Quappe.
Quappe [] quappe = new Quappe[Q];

void setup() {
  fullScreen();
  noCursor();
  for (int x = 1; x<Q; x++) {
    quappe[x] = new Quappe(random(width), random(height));
  }
  quappe[0] = new Quappe(mouseX, mouseY);
}

void draw() {
  background(255);
  for (int b = 1; b <Q; b++) {
    quappe[b].display();
    quappe[b].edageCheck();
    quappe[b].moveQuappe();
    quappe[b].speedLimit();
  }

  for (int d1 = 1; d1 <(Q-1)/2; d1++) {
    for (int d2 = Q-1; d2>=(Q-1)/2; d2-- )
      //quappe[d1].touch(quappe[d2]);
      quappe[d1].runway(quappe[d2]);
  }

  quappe[0].circlex=mouseX;
  quappe[0].circley=mouseY;
  quappe[0].display();

  for (int c = 1; c <Q; c++) {
    quappe[c].runway(quappe[0]);
  }
}

void mousePressed() {
  for (int d = 1; d <Q; d++) {
    quappe[d].fear(random(5));
  }
}
