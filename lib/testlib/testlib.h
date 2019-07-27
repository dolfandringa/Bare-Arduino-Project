#ifndef TESTLIB_H
#define TESTLIB_H
#include <Arduino.h>
#include <SPI.h>

class TestLib
{
    int DRPin;
    int CSPin;
    public:
        TestLib(int, int);
        int8_t begin();
        int8_t doSomeSPI(char[10]);
};
#endif
