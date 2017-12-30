class GameBaseProcess {
  
  GameBaseProcess() {
  }
  
  void start_process() {
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