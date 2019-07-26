#include <Arduino.h>
#include <ArduinoUnitTests.h>
#include <testlib.h>

GodmodeState* state = GODMODE();

unittest_setup() {
    state->reset();
}

unittest(my_first_test) {
    assertEqual("", state->spi.dataIn);
    assertEqual("", state->spi.dataOut);
    char buff2[10] = "blablabla";
    TestLib testLib(5, 2);
    testLib.doSomeSPI(buff2);
    assertEqual("blablabla", state->spi.dataOut);
}

unittest_main()
