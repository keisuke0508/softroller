class Player extends ObjectBase {
  PImage img, img_right, img_left, img_fall;
  float x, y;
  
  Player() {
    x = 350;
    y = 250;
    load_images();
    img = img_right;
  }
  
  void load_images() {
    img_right = loadImage("img/heli_right.png");
    img_left = loadImage("img/heli_left.png");
    img_fall = loadImage("img/heli_fall.png");
  }
  
  void set_player() {
    image(img, x, y, 100, 100);
  }
  
  void redraw_player() {
    get_cursor_axis();
    correct_axis();
    image(img, x, y, 100, 100);
  }
  
  void redraw_player_by_softroller(HashMap axis) {
    get_horizontal_motion(String.valueOf(axis.get("x")));
    get_vertical_motion(String.valueOf(axis.get("y")));
    correct_axis();
    image(img, x, y, 100, 100);
  }
  
  void get_horizontal_motion(String _x){
    if(_x == "LEFT") {
      x -= 10;
    }else if(_x == "RIGHT") {
      x += 10;
    }else {
    }
  }
  
  void get_vertical_motion(String _y) {
    if(_y == "DOWN") {
      y += 10;
    }else if(_y == "UP") {
      y -= 10;
    }else {
    }
  }
  
  void correct_axis() {
    correct_x();
    correct_y();
  }
  
  void correct_x() {
    if(x < 0) {
      x = 0;
    }else if(x > 800) {
      x = 700;
    }
  } 
  
  void correct_y() {
    if(y < 0) {
      y = 0;
    }else if(y > 600) {
      y = 500;
    }
  }
  
  void get_cursor_axis() {
    x = get_mouse_x() - 50;
    y = get_mouse_y() - 50;
  }
  
  void change_image(PImage image) {
    img = image;
  }
  
  void finish_process() {
    if(img != img_fall) {
      change_image(img_fall);
    }
    fall_effect();
  }
  
  void fall_effect() {
    if(y <= 500) {
      y += 10;
    }
    image(img, x, y, 100, 100);
  }
  
  HashMap get_player_axis() {
    return get_axis(x, y);
  }
  
}