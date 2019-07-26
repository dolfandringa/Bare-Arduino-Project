#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/bootstrap.sh"

echo "Installing dependencies needed to build the sources and tests..."

ARDUINO_BASENAME="arduino-1.8.9"
ARDUINO_FILE="$ARDUINO_BASENAME-linux64.tar.xz"
ARDUINO_URL="https://downloads.arduino.cc/$ARDUINO_FILE"

echo "Downloading $ARDUINO_BASENAME from $ARDUINO_URL"
wget "$ARDUINO_URL" -O "$ARDUINO_FILE"

echo "Unzipping $ARDUINO_BASENAME"
tar xf "$ARDUINO_FILE"

#echo "Installing avr-gcc to $AVR_GCC"
#sudo mv "$ARDUINO_BASENAME/hardware/tools/avr" "$AVR_GCC"

echo "Install Arduino to $ARDUINO"
sudo rm -rf "$ARDUINO/$ARDUINO_BASENAME"
if [ -L "$ARDUINO/hardware" ]; then
    sudo unlink "$ARDUINO/hardware";
fi;
if [ -d "$ARDUINO/hardware" ]; then
    sudo rm -rf "$ARDUINO/hardware";
fi;
if [ -L "$ARDUINO/lib" ]; then
    sudo unlink "$ARDUINO/lib";
fi;
if [ -d "$ARDUINO/lib" ]; then
    sudo rm -rf "$ARDUINO/lib";
fi;
sudo mv "$ARDUINO_BASENAME/" "$ARDUINO"
sudo ln -s "$ARDUINO/$ARDUINO_BASENAME/hardware" "$ARDUINO/hardware"
sudo ln -s "$ARDUINO/$ARDUINO_BASENAME/lib" "$ARDUINO/lib"


echo "Installing arduino_ci"
cd $CWD
bundler install --path vendor/bundle

echo "Installation of dependencies is complete..."
