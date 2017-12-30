class Player extends ObjectBase {
  PImage img, img_right, img_left, img_fall;
  float x, y;
  
  Player() {
    x = 350;
    y = 250;
    load_imgs();
    img = img_right;
  }
  
  void load_imgs() {
    img_right = loadImage("heli_right.png");
    img_left = loadImage("heli_left.png");
    img_fall = loadImage("heli_fall.png");
  }
  
  void set_player() {
    image(img, x, y, 100, 100);
  }
  
  void redraw_player() {
    get_cursor_axis();
    image(img, x, y, 100, 100);
  }
  
  void get_cursor_axis() {
    x = get_mouse_x() - 50;
    y = get_mouse_y() - 50;
  }
  
}