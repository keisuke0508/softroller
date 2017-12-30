class Bullet extends ObjectBase {
  float x, y;
  String direction;
  boolean is_limit;
  
  Bullet() {
    direction = get_bullet_direction();
    x = get_initial_bullet_x();
    y = get_initial_bullet_y();
    is_limit = false;
  }
  
  String get_bullet_direction() {
    float r = random(1.0);
    if(r < 0.25) {
      direction = "left";
    }else if(r >= 0.25 && r < 0.5) {
      direction = "right";
    }else if(r >= 0.5 && r < 0.75) {
      direction = "up";
    }else {
      direction = "under";
    }
    return(direction);
  }
  
  float get_initial_bullet_x() {
    float _x = 0;
    if(direction == "left") {
      _x = 0;
    }else if(direction == "right") {
      _x = 800;
    }else if(direction == "up") {
      _x = get_mouse_x();
    }else if(direction == "under") {
      _x = get_mouse_x();
    }
    return _x;
  }
  
  float get_initial_bullet_y() {
    float _y = 0;
    if(direction == "left") {
      _y = get_mouse_y();
    }else if(direction == "right") {
      _y = get_mouse_y();
    }else if(direction == "up") {
      _y = 0;
    }else if(direction == "under") {
      _y = 600;
    }
    return _y;
  }
  
  void draw_bullet() {
    fill(255, 0, 0);
    noStroke();
    ellipse(x, y, 20, 20);
  }
  
  boolean redraw_bullet() {
    if(direction == "left") {
      x += 10;
      if(x >= 800) {
        is_limit = true;
      }
    }else if(direction == "right") {
      x -= 10;
      if(x <= 0) {
        is_limit = true;
      }
    }else if(direction == "up") {
      y += 10;
      if(y >= 600) {
        is_limit = true;
      }
    }else if(direction == "under") {
      y -= 10;
      if(y <= 0) {
        is_limit = true;
      }
    }
    draw_bullet();
    return is_limit;
  }
  
  HashMap get_bullet_axis() {
    return get_axis(x, y);
  }
  
}