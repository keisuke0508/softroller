import processing.serial.*;
import cc.arduino.*;

class Controller {
  int right_val, left_val, x_axis, y_axis;
  int right_pin, left_pin, x_pin, y_pin;
  PApplet game;
  Arduino arduino;
  
  Controller(PApplet p) {
    game = p;
    arduino = new Arduino(game, get_device_name(), get_baud_rate());
    set_pin();
    initialize_values();
    set_pin_mode();
  }
  
  void set_pin_mode() {
    arduino.pinMode(right_pin, Arduino.INPUT);
    arduino.pinMode(left_pin, Arduino.INPUT);
    arduino.pinMode(x_pin, Arduino.INPUT);
    arduino.pinMode(y_pin, Arduino.INPUT);
  }
  
  void initialize_values() {
    right_val = 0;
    left_val = 0;
    x_axis = 0;
    y_axis = 0;
  }
  
  void set_pin() {
    right_pin = 5;
    left_pin = 4;
    x_pin = 0;
    y_pin = 1;
  }
  
  void read_values() {
    right_val = arduino.analogRead(right_pin);
    left_val = arduino.analogRead(left_pin);
    x_axis = arduino.analogRead(x_pin);
    y_axis = arduino.analogRead(y_pin);
  }
  
  boolean get_right_pressure() {
    if(right_val < 500) {
      return(true);
    }
    return(false);
  }
  
  boolean get_left_pressure() {
    if(left_val < 500) {
      return(true);
    }
    return(false);
  }
  
  String get_x_axis() {
    String input;
    if(x_axis < 400) {
      input = "LEFT";
    }else if(x_axis > 600) {
      input = "RIGHT";
    }else {
      input = "CENTER";
    }
    return(input);
  }
  
  String get_y_axis() {
    String input;
    if(y_axis < 400) {
      input = "DOWN";
    }else if(y_axis > 600) {
      input = "UP";
    }else {
      input = "CENTER";
    }
    return(input);
  }
  
  String get_device_name() {
    return "/dev/cu.usbmodem1411";
  }
  
  int get_baud_rate() {
    return 57600;
  }
  
  HashMap get_pressure_input() {
    HashMap<String, Boolean> input = new HashMap<String, Boolean>();
    input.put("right", get_right_pressure());
    input.put("left", get_left_pressure());
    return input;
  }
  
  HashMap get_axis_input() {
    HashMap<String, String> input = new HashMap<String, String>();
    input.put("x", get_x_axis());
    input.put("y", get_y_axis());
    return input;
  }
  
  HashMap get_input() {
    HashMap<String, HashMap> input = new HashMap<String, HashMap>();
    input.put("pressure", get_pressure_input());
    input.put("axis", get_axis_input());
    return input;
  }
  
}