#!/usr/bin/env bash

SCRIPTS_DIR=$(dirname -- $(readlink -f -- "$0"))

CWD=$(readlink -f "$SCRIPTS_DIR/..")
SRC="$CWD/src"
TEST="$CWD/test"
ARDMK="$CWD/Arduino-Makefile"

AVR_GCC="/usr/share/avr-gcc"
ARDUINO="/usr/share/arduino"
ARDUINO_CI="$CWD/arduino_ci/cpp"
ARDUINO_BASENAME="arduino-1.8.9"
