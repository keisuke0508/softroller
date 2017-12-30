Player p;
Bullet b;

void setup() {
  size(800, 600);
  p = new Player();
  b = new Bullet();
  p.set_player();
  b.draw_bullet();
}

void draw() {
  background(255);
  p.redraw_player();
  boolean is_limit = b.redraw_bullet();
  if(is_limit) {
    b = null;
    b = new Bullet();
    b.draw_bullet();
  }
}