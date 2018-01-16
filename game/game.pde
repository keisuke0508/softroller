Player p;
Bullet b;
GameBaseProcess processer;
Controller controller;
SaveGameLog save_log;
LoadGameLog load_log;

boolean softroller;

void initialize() {
  if(processer != null) {
    processer = null;
    p = null;
    b = null;
  }
  processer = new GameBaseProcess(this);
  save_log = new SaveGameLog();
  load_log = new LoadGameLog();
  p = new Player();
  b = new Bullet(softroller, p.get_player_axis());
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
    processer.write_max_log(load_log.get_log());
    if(softroller) {
      controller.read_values();
      HashMap<String, Boolean> pressure = controller.get_pressure_input();
      if(pressure.get("right") && pressure.get("left")) {
        processer.finish_title();
        processer.play_select_bgm();
      }
    }
  }else {
    if(!processer.is_started) {
      p.set_player();
      processer.start_process();
    }else {
      b.redraw_bullet();
      if(b.is_limit) {
        b = null;
        b = new Bullet(softroller, p.get_player_axis());
        b.draw_bullet();
        processer.play_fired_bgm();
      }
      if(processer.is_attacked) {
        p.finish_process();
        if(p.y >= 500) {
          processer.finish_process();
          if(softroller) {
            controller.read_values();
            HashMap<String, Boolean> pressure = controller.get_pressure_input();
            if(pressure.get("right") && pressure.get("left")) {
              save_log.save_log(processer.score);
              initialize();
              processer.play_select_bgm();
            }
          }
        }
      }else {
        if(softroller) {
          controller.read_values();
          p.redraw_player_by_softroller(controller.get_axis_input());
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
      initialize();
    }
    processer.play_select_bgm();
  }
}