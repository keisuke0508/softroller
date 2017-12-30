Player p;
Bullet b;
GameBaseProcess processer;

boolean is_limit, is_attacked;

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
  is_limit = b.redraw_bullet();
  if(is_limit) {
    b = null;
    b = new Bullet();
  }
  if(is_attacked) {
    p.finish_process();
  }else {
    p.redraw_player();
    is_attacked = processer.attack_process(p.get_player_axis(), b.get_bullet_axis());
  }
}