import ddf.minim.*;

class GameBaseProcess {
  int start_count;
  boolean is_title, is_started, is_attacked;
  int score;
  PApplet game;
  Minim minim;
  AudioPlayer main_bgm;
  AudioSample select_bgm, count_bgm, fired_bgm, attacked_bgm;
  PImage bg_img;
  
  GameBaseProcess(PApplet p) {
    game = p;
    start_count = 3;
    is_started = false;
    is_attacked = false;
    is_title = true;
    score = 0;
    minim = new Minim(game);
    load_bgms();
    play_main_bgm();
    load_bg_img();
    set_bg_img();
  }
  
  void title_process() {
    textSize(72);
    textAlign(CENTER);
    fill(0, 0, 255);
    text("Helicopter", 400, 300);
    textSize(36);
    text("push enter to start", 400, 500);
  }
  
  void load_bgms() {
    main_bgm = minim.loadFile("bgm/main.mp3");
    select_bgm = minim.loadSample("bgm/select.mp3");
    count_bgm = minim.loadSample("bgm/count.mp3");
    fired_bgm = minim.loadSample("bgm/fired.mp3");
    attacked_bgm = minim.loadSample("bgm/attacked.mp3");
  }
  
  void load_bg_img() {
    bg_img = loadImage("img/background.png");
  }
  
  void set_bg_img() {
    image(bg_img, 0, 0, 800, 600);
  }
  
  void play_main_bgm() {
    main_bgm.loop();
  }
  
  void play_select_bgm() {
    select_bgm.trigger();
  }
  
  void play_count_bgm() {
    count_bgm.trigger();
  }
  
  void play_fired_bgm() {
    fired_bgm.trigger();
  }
  
  void play_attacked_bgm() {
    attacked_bgm.trigger();
  }
  
  void finish_title() {
    is_title = false;
  }
  
  void start_process() {
    draw_count();
    play_count_bgm();
    judge_started();
    start_count -= 1;
    delay(1000);
  }
  
  void judge_started() {
    if(start_count == 0) {
      is_started = true;
    }else {
      is_started = false;
    }
  }
  
  void draw_count() {
    textSize(128);
    textAlign(CENTER);
    fill(0, 0, 255);
    text(String.valueOf(start_count), 400, 300);
  }
  
  void finish_process() {
    textSize(72);
    textAlign(CENTER);
    fill(0, 0, 255);
    text("GameOver", 400, 200);
    text("Score: " + String.valueOf(score), 400, 400);
  }
  
  void add_score() {
    score += 1;
  }
  
  void draw_score() {
    textSize(18);
    textAlign(CENTER);
    fill(0);
    text("Score: " + String.valueOf(score), 700, 20);
  }
  
  void attack_judge_process(HashMap<String, Float> player, 
                              HashMap<String, Float> bullet) {
    float player_x, player_y, bullet_x, bullet_y;
    player_x = player.get("x");
    player_y = player.get("y");
    bullet_x = bullet.get("x");
    bullet_y = bullet.get("y");
    if(player_x < bullet_x && player_x + 80 > bullet_x &&
        player_y < bullet_y && player_y + 80 > bullet_y) {
          is_attacked = true;
          play_attacked_bgm();
    }else {
      is_attacked = false;
    }
  }
  
}