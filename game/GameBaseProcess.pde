class GameBaseProcess {
  int start_count;
  boolean is_started, is_attacked;
  
  GameBaseProcess() {
    start_count = 3;
    is_started = false;
    is_attacked = false;
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