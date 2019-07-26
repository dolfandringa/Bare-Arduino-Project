#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/bootstrap.sh"

#BOARDS_TXT="$ARDUINO/hardware/arduino/avr/boards.txt"
#ARDUINO="$ARDUINO_CI"

failures=()
successes=()

cd "$SRC"
for dir in *; do
    echo "Checking $dir"

	if [ -d "${dir}" ]; then

		echo "Compiling $dir..."

		echo $CWD
		cd $dir

		cp $CWD/Makefile-CI.mk Makefile

		make PROJECT_DIR=$CWD ARDUINO_DIR=$ARDUINO AVR_TOOLS_DIR=$AVR_GCC

		if [[ $? -ne 0 ]]; then
			failures+=("$dir")
			echo "Source $dir failed"
		else
			successes+=("$dir")
			echo "Source $dir succeeded"
		fi

		cd ..

	fi

done

echo "Running tests"

cd "$TEST"
for dir in *; do
    
    echo "Checking $dir"
    if [ -d "${dir}" ]; then

		echo "Compiling $dir..."

		cd $dir

		cp $CWD/Makefile-CI.mk Makefile

		make PROJECT_DIR=$CWD ARDUINO_DIR=$ARDUINO ARDUINO_CORE_PATH=$ARDUINO_CI/arduino AVR_TOOLS_DIR=$AVR_GCC BOARDS_TXT=$BOARDS_TXT

		if [[ $? -ne 0 ]]; then
			failures+=("$dir")
			echo "Test $dir failed"
		else
			successes+=("$dir")
			echo "Source $dir succeeded"
		fi

		cd ..
	fi

done

if [[ ${#failures[@]} -ne 0 ]]; then
	echo "The following builds succeeded:"
	for success in "${successes[@]}"; do
		echo "- Building $success succeeded"
	done

	echo "The following builds failed:"
	for failure in "${failures[@]}"; do
		echo "- Building $failure failed"
	done
fi

if [[ ${#failures[@]} -eq 0 ]]; then
	echo "All tests passed."
else
	exit 1
fi
