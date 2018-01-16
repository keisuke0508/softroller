class LoadGameLog {
  JSONObject json;
  int score;
  String date;
  String path;
  String log;
  
  LoadGameLog() {
    path = "data/json/game_log.json";
    make_log_string();
  }
  
  void make_log_string() {
    try {
      json = loadJSONObject(path);
      score = json.getInt("score");
      date = json.getString("date");
      log = date + ", score:" + String.valueOf(score);
    }catch(Exception e) {
      log = "";
    }
  }
  
  String get_log() {
    return log;
  }
}