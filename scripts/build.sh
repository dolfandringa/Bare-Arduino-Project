#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/bootstrap.sh"

OS=$(uname -s);

failures=()
successes=()

function build() {
    dir=$1
    echo "Compiling $dir..."

    echo $CWD
    cd $dir

    if [[ $OS == "Linux" ]]; then
        cp $CWD/Makefile-Linux.mk Makefile
    fi
    if [[ $OS == "Darwin" ]]; then
        cp $CWD/Makefile-OSX.mk Makefile
    fi

    make PROJECT_DIR=$CWD ARDUINO_DIR=$ARDUINO AVR_TOOLS_DIR=$AVR_GCC
    return $?

}

cd "$CWD"

if [[ $1  == "" ]];then
    for dir in src/*; do
        echo "Checking $dir"
        if [ -d "$dir" ]; then
            build $dir
            if [[ $? -ne 0 ]]; then
                failures+=("$dir")
                echo "Source $dir failed"
            else
                successes+=("$dir")
                echo "Source $dir succeeded"
            fi
        fi
        cd "$CWD"
    done
else
    if [ -d "$1" ]; then
        build $1
    else
        echo "$1 is not a directory"
    fi
fi

