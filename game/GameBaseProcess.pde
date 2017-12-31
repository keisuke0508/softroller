class GameBaseProcess {
  int start_count;
  boolean is_started;
  
  GameBaseProcess() {
    start_count = 3;
    is_started = false;
  }
  
  boolean start_process() {
    draw_count();
    judge_started();
    start_count -= 1;
    delay(1000);
    return(is_started);
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
    fill(0, 0, 255);
    text(String.valueOf(start_count), 360, 330);
  }
  
  void finish_process() {
  }
  
  boolean attack_process(HashMap<String, Float> player, HashMap<String, Float> bullet) {
    float player_x, player_y, bullet_x, bullet_y;
    player_x = player.get("x");
    player_y = player.get("y");
    bullet_x = bullet.get("x");
    bullet_y = bullet.get("y");
    if(player_x < bullet_x && player_x + 80 > bullet_x &&
        player_y < bullet_y && player_y + 80 > bullet_y) {
          return(true);
        }
        return(false);
  }
  
}