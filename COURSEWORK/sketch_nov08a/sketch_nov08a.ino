const int sensorPin = 0;
const int ledPin = 13;

int lightlevel;
int mappedlightlevel;

void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  lightlevel = analogRead(sensorPin);
  Serial.print(lightlevel);
  digitalWrite(ledPin, HIGH);
  delay(lightlevel);
  digitalWrite(ledPin, LOW);
  delay(lightlevel);
}
