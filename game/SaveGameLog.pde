class SaveGameLog {
  JSONObject save_json, load_json;
  String path;
  
  SaveGameLog() {
    save_json = new JSONObject();
    load_json = new JSONObject();
    path = "data/json/game_log.json";
  }
  
  void save_log(int score) {
    int max_score;
    try {
      max_score = get_max_score();
    }catch(Exception e) {
      max_score = 0;
    }
    if(score >= max_score) {
      save_json.setInt("score", score);
      save_json.setString("date", get_time());
      saveJSONObject(save_json, path);
    }
  }
  
  int get_max_score() {
    load_json = loadJSONObject(path);
    return load_json.getInt("score");
  }
  
  String get_time() {
    String year = String.valueOf(year());
    String month = String.valueOf(month());
    String day = String.valueOf(day());
    String hour = String.valueOf(hour());
    String minute = String.valueOf(minute());
    String second = String.valueOf(second());
    return(year + "/" + month + "/" + day + ", " + hour + ":" + minute + ":" + second);
  }
  
}