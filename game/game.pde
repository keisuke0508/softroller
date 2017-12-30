Player p;
Bullet b;
GameBaseProcess processer;

void setup() {
  size(800, 600);
  p = new Player();
  b = new Bullet();
  processer = new GameBaseProcess();
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
  boolean is_attacked = processer.attack_process(p.get_player_axis(), b.get_bullet_axis());
  if(is_attacked) {
    delay(1000);
  }
}