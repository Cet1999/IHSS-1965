const int sensorPin = 0;
const int ledPin = 9;

int lightLevel;
int calibratedlightLevel;
int maxThresh = 0;
int minThresh = 1023;

void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);  

}

void loop() {
  lightLevel = analogRead(sensorPin);
  Serial.print(lightLevel);

  calibratedlightLevel = map(lightLevel, minThresh, maxThresh, 0, 255);
  
}
