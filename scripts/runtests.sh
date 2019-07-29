#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/bootstrap.sh"

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
cd "$CWD" 
PATH="$ARDUINO/$ARDUINO_BASENAME:$PATH" bundle exec arduino_ci_remote.rb --skip-compilation
