#include <Arduino.h>
#include "testlib.h"

TestLib::TestLib (int dataReadyPin, int chipSelectPin) {
    DRPin = dataReadyPin;
    CSPin = chipSelectPin;
};

int8_t TestLib::begin () {
    pinMode(DRPin, INPUT);
    pinMode(CSPin, OUTPUT);
    SPI.begin();
    delay(100);
    return 0;
};

int8_t TestLib::doSomeSPI(char buff[10]) {
    digitalWrite(CSPin, LOW);
    SPI.transfer(buff, 9);
    digitalWrite(CSPin, HIGH);
    return 0;
}
