Player p;
Bullet b;
GameBaseProcess processer;

void setup() {
  size(800, 600);
  p = new Player();
  b = new Bullet();
  processer = new GameBaseProcess();
}

void draw() {
  background(255);
  if(!processer.is_started) {
    p.set_player();
    processer.start_process();
  }else {
    b.redraw_bullet();
    if(b.is_limit) {
      b = null;
      b = new Bullet();
      b.draw_bullet();
    }
    if(processer.is_attacked) {
      p.finish_process();
    }else {
      p.redraw_player();
      processer.attack_judge_process(p.get_player_axis(), b.get_bullet_axis());
      processer.add_score();
    }
  }
}