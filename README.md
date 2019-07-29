
# Bare Arduino Project combined with arduino_ci

This is a combination of the [Bare Arduino Project](https://github.com/ladislas/Bare-Arduino-Project) and [arduino_ci](https://github.com/ianfixes/arduino_ci).
Most stuff is documented on their github projects. Please refer to those for more info. Here is what changed based on my work.

* Arduino libraries go into lib
* Arduino sketches go into their own subdirectory of /src

## Installation
With your normal package manager (apt/dnf/yum/homebrew/etc), install the following
* avr-gcc
* avr-libc
* avrdude
* rubygem-bundler

Once that is installed, run
```
./scripts/install.sh
```

This should install all dependencies (including Arduino) for development and testing. 

## Compiling

For now, the Makefile at the root isn't working perfectly, so use the scripts in `scripts/`

### Compilation of one sketch:

```
./scripts/build.sh src/my-project
```

### Compilation of all sketches:

```
./scripts/build.sh
```

### Upload a sketch

```
./scripts/upload.sh src/my-project
```

This should upload it to any available `/dev/ttyUSB*` device.

### Customization

The scripts/bootstrap.sh script contains some of the bootstrapping.
You can override the stuff there by setting your own environment variables for instance in `~/.bashrc`.


## Contributing

Help is always more than welcome. If you want to take part in this project, please, make sure you read our [Contributing guidelines](./CONTRIBUTING.md).

## Copyright and License

    The MIT License (MIT)

    Copyright (c) 2014 Ladislas de Toldi - ladislas at leka dot io

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
