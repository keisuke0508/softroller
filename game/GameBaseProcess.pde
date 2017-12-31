class GameBaseProcess {
  int start_count;
  boolean is_title, is_started, is_attacked;
  int score;
  
  GameBaseProcess() {
    start_count = 3;
    is_started = false;
    is_attacked = false;
    is_title = true;
    score = 0;
  }
  
  void title_process() {
    textSize(72);
    textAlign(CENTER);
    fill(0, 0, 255);
    text("SampleGame", 400, 300);
    textSize(36);
    text("please push enter key", 400, 500);
  }
  
  void finish_title() {
    is_title = false;
  }
  
  void start_process() {
    draw_count();
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
  
  void attack_judge_process(HashMap<String, Float> player, HashMap<String, Float> bullet) {
    float player_x, player_y, bullet_x, bullet_y;
    player_x = player.get("x");
    player_y = player.get("y");
    bullet_x = bullet.get("x");
    bullet_y = bullet.get("y");
    if(player_x < bullet_x && player_x + 80 > bullet_x &&
        player_y < bullet_y && player_y + 80 > bullet_y) {
          is_attacked = true;
    }else {
      is_attacked = false;
    }
  }
  
}