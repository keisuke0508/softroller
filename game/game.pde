Player p;

void setup() {
  size(800, 600);
  p = new Player();
  p.set_player();
}

void draw() {
  background(255);
  p.redraw_player();
}