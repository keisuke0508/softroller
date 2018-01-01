const int right_pin = 4, left_pin = 5;
const int x_pin = 0, y_pin = 1;
int right_val, left_val;
int x_axis, y_axis;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  get_values();
  serial_connect();
}

void get_values() {
  right_val = analogRead(right_pin);
  left_val = analogRead(left_pin);
  x_axis = analogRead(x_pin);
  y_axis = analogRead(y_pin);
}

void serial_connect() {
  if(Serial.available() > 0) {
    Serial.write(right_val);
    Serial.write(left_val);
    Serial.write(x_axis);
    Serial.write(y_axis);
    Serial.read();
  }
}

void print_values() {
  Serial.print("x: ");
  Serial.println(x_axis);
  Serial.print("y: ");
  Serial.println(y_axis);
  Serial.print("right: ");
  Serial.println(right_val);
  Serial.print("left: ");
  Serial.println(left_val); 
}

