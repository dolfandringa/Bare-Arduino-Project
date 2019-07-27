#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/bootstrap.sh"

OS=$(uname -s);

failures=()
successes=()

function upload() {
    dir=$1
    echo "Uploading $dir..."

    echo $CWD
    cd $dir

    if [[ $OS == "Linux" ]]; then
        cp $CWD/Makefile-Linux.mk Makefile
    fi
    if [[ $OS == "Darwin" ]]; then
        cp $CWD/Makefile-OSX.mk Makefile
    fi

    make upload PROJECT_DIR=$CWD ARDUINO_DIR=$ARDUINO AVR_TOOLS_DIR=$AVR_GCC
    return $?

}

cd "$CWD"

if [[ $1 == "" ]];then
    echo "Please specify a directory (like src/atka-node) to upload";
else

    if [ -d "$1" ]; then
        upload $1
    else
        echo "$1 is not a directory"
    fi
fi
