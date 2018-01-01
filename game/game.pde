Player p;
Bullet b;
GameBaseProcess processer;
Controller controller;

boolean softroller;

void initialize() {
  p = new Player();
  b = new Bullet();
  processer = new GameBaseProcess(this);
}

void setup() {
  size(800, 600);
  try {
    controller = new Controller(this);
    softroller = true;
  }catch(Exception e) {
    println(e);
    softroller = false;
  }
  initialize();
}

void draw() {
  background(255);
  if(processer.is_title) {
    processer.title_process();
  }else {
    if(!processer.is_started) {
      p.set_player();
      processer.start_process();
    }else {
      b.redraw_bullet();
      if(b.is_limit) {
        b = null;
        b = new Bullet();
        b.draw_bullet();
        processer.play_fired_bgm();
      }
      if(processer.is_attacked) {
        p.finish_process();
        if(p.y >= 500) {
          processer.finish_process();
        }
      }else {
        if(softroller) {
          controller.read_values();
          p.redraw_player_by_softroller(controller.get_axis_input());
          println(controller.x_axis);
          println(controller.y_axis);
        }else {
          p.redraw_player();
        }
        processer.attack_judge_process(p.get_player_axis(), b.get_bullet_axis());
        processer.add_score();
        processer.draw_score();
      }
    }
  }
}

void keyPressed() {
  if(key == ENTER) {
    if(processer.is_title) {
      processer.finish_title();
    }else {
      p = null;
      b = null;
      processer = null;
      initialize();
    }
    processer.play_select_bgm();
  }
}