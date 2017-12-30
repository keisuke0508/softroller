class ObjectBase {
  
  ObjectBase() {
  }
  
  float get_mouse_x() {
    return pmouseX;
  }
  
  float get_mouse_y() {
    return pmouseY;
  }
  
  HashMap get_axis(float x, float y) {
    HashMap<String, Float> axis = new HashMap<String, Float>();
    axis.put("x", x);
    axis.put("y", y);
    return axis;
  }
  
}