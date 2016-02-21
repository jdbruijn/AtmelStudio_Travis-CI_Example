# Convert Atmel Studio Makefile to Unix format
[![License GPLv3][badge-license]][license]
[![Travis build status][badge-travis]][travis-build]

Example of an Atmel Studio project for an ATmega328P with automated build on [Travis CI][travis-ci] (or any other Linux-based system).


# Documentation
At the moment this script is only tested using an Atmel Studio 7 project for an ATmega328P, but it should work for every MCU. Please let me know if you've tested it with a different version of Atmel Studio or a different MCU.

## Set up repository for Travis CI
In order to set up a repository of a Atmel Studio project for automatic builds on Travis CI the `.travis.yml` and `convertASMakefileToUnix.sh` scripts need to be present in the repository. Examples of those scripts can be found in this repository. Once those files are present in the repository, Travis CI needs to know that it has to build a project. More information on how to setup a repository with Travis CI can be found in their [Getting Started Docs][travis-getstarted].

## Atmel AVR Toolchain for Linux
In order to be able to build an Atmel Studio project on Linux, the [Atmel AVR Toolchain for Linux][atmel-toolchain] needs to be present on the system.
Linux provides these packages and they can be installed as shown below.
```shell
sudo apt-get update
sudo apt-get install binutils-avr gcc-avr avr-libc
```

## convertASMakefileToUnix script
This script converts a Atmel Studio, and thus Windows, makefile to a Linux makefile. It requires the Atmel AVR Toolchain for Linux to be installed on the system.

### Usage
```
usage: convertASMakefileToUnix.sh [-h] PROJECT_DIR

This script converts an Atmel Studio 7 makefile to a Unix format.
This way it should be possible to build the project under Unix (for example Ubuntu) using the Atmel AVR Toolchain for Linux.

positional arguments:
  PROJECT_DIR        The directory of the project.

optional arguments:
  -h,                Show this help message and exit.
```

### Example
```
lizzard@ubuntu:~/Documents/AtmelStudio_Travis-CI_Example$ ./convertMkToUnix.sh AtmelStudio_Travis-CI_Example
convertASMakefileToUnix 0.1.0 Copyright (c) 2016 Jeroen de Bruijn <vidavidorra@gmail.com>
This program comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under certain conditions.

TARGET_DIR: AtmelStudio_Travis-CI_Example/Debug
TARGET_MAKEFILE: AtmelStudio_Travis-CI_Example/Debug/Makefile
AVR_GCC_VERSION: 4.5.3

*** convertASMakefileToUnix has finished ***
```

# Licensing
GNU General Public License version 3 or later, as published by the Free Software Foundation.
Modification and redistribution are permitted according to the terms of the GPL.
The license can be found in the `LICENSE` file.

[Pull requests](https://github.com/vidavidorra/AtmelStudio_Travis-CI_Example/pulls) and [bug reports](https://github.com/vidavidorra/AtmelStudio_Travis-CI_Example/issues) are welcome!


[badge-license]:        https://img.shields.io/badge/license-GPLv3-blue.svg
[license]:              https://github.com/vidavidorra/AtmelStudio_Travis-CI_Example/blob/master/LICENSE
[badge-travis]:         https://travis-ci.org/vidavidorra/AtmelStudio_Travis-CI_Example.svg
[travis-build]:         https://travis-ci.org/vidavidorra/AtmelStudio_Travis-CI_Example
[travis-ci]:            https://travis-ci.org
[travis-getstarted]:    https://docs.travis-ci.com/user/getting-started
[travis-docs]:          https://docs.travis-ci.com
[atmel-toolchain]:      http://www.atmel.com/tools/atmelavrtoolchainforlinux.aspx
