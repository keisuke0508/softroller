class ObjectBase {
  
  ObjectBase() {
  }
  
  float get_mouse_x() {
    return pmouseX;
  }
  
  float get_mouse_y() {
    return pmouseY;
  }
  
  boolean get_random_bool() {
    float f = random(1.0);
    if(f < 0.5) {
      return true;
    }
    return false;
  }
  
}