#!/bin/sh
################################################################################
# 
# Copyright (c) 2016  Jeroen de Bruijn  <vidavidorra@gmail.com>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################
# Title         : convertASMakefileToUnix.sh
# Date created  : 2016/02/20
# Notes         :
__AUTHOR__="Jeroen de Bruijn"
__LICENSE__="GPLv3"
__VERSION__="0.1.0"
__MAINTAINER__="Jeroen de Bruijn"
__EMAIL__="vidavidorra@gmail.com"
__LICENSE_INFO__="convertASMakefileToUnix ${__VERSION__}  Copyright (c) 2016  "
__LICENSE_INFO__=$__LICENSE_INFO__"${__AUTHOR__} <${__EMAIL__}>\n"
__LICENSE_INFO__=$__LICENSE_INFO__"This program comes with ABSOLUTELY NO WARRANTY.\n"
__LICENSE_INFO__=$__LICENSE_INFO__"This is free software, and you are welcome to "
__LICENSE_INFO__=$__LICENSE_INFO__"redistribute it under certain conditions."
__DESCRIPTION__="This script converts an Atmel Studio 7 makefile to a Unix format.\n"
__DESCRIPTION__=$__DESCRIPTION__"This way it should be possible to build the project "
__DESCRIPTION__=$__DESCRIPTION__"under Unix (for example Ubuntu) using the Atmel AVR "
__DESCRIPTION__=$__DESCRIPTION__"Toolchain for Linux."
#
# This script converts an Atmel Studio 7 makefile to a Unix format.
# This way it should be possible to build the project under Unix
# (for example Ubuntu) using the Atmel AVR Toolchain for Linux.
#
################################################################################

################################################################################
##### Setup this script and run.                                           #####
PROJECT_DIR=$1

echo $__LICENSE_INFO__
echo ''

# Check if avr-gcc is installed
if ! type "avr-gcc" > /dev/null; then
    echo 'Error: The program "avr-gcc" is not installed on this system.'
    echo 'Please install and run this script again.'
    echo ' Install suggestion: "sudo apt-get install avr-gcc"'
    echo 'exiting...'
    exit 1
fi

# Check if an correct argument is passed and show help message accordingly.
if [ "$PROJECT_DIR" = "-h" ] || [ "$PROJECT_DIR" = "" ] || [ ! -d "$PROJECT_DIR" ]; then
    echo 'usage: convertASMakefileToUnix.sh [-h] PROJECT_DIR'
    echo ''
    echo $__DESCRIPTION__
    echo ''
    echo 'positional arguments:'
    echo '  PROJECT_DIR        The directory of the project.'
    echo ''
    echo 'optional arguments:'
    echo '-h, --help         show this help message and exit'
    
    # If the project directory does not exist show a error message.
    if [ ! -d "$PROJECT_DIR" ] && [ "$PROJECT_DIR" != "-h" ] && [ "$PROJECT_DIR" != "" ]; then
        echo ''
        echo "Error: Directory \"$(pwd)/${PROJECT_DIR}\" does not exist."
        echo 'exiting...'
    fi
    exit 1
else
    TARGET_DIR=${PROJECT_DIR}/Debug
    TARGET_MAKEFILE=${TARGET_DIR}/Makefile
    AVR_GCC_VERSION=$(avr-gcc --version | grep ^avr-gcc | sed 's/^.* //g')
    
    echo "TARGET_DIR: ${TARGET_DIR}"
    echo "TARGET_MAKEFILE: ${TARGET_MAKEFILE}"
    echo "AVR_GCC_VERSION: ${AVR_GCC_VERSION}"
    
    sed -i 's/cmd.exe/sh/g' ${TARGET_MAKEFILE}
    sed -i "s/4.9.2/${AVR_GCC_VERSION}/g" ${TARGET_MAKEFILE}
    sed -i 's/C:\\Program Files (x86)\\Atmel\\Studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\bin\\avr-/\/usr\/bin\/avr-/g' ${TARGET_MAKEFILE}
    sed -i 's/.exe//g' ${TARGET_MAKEFILE}
    echo ''
    echo '*** convertASMakefileToUnix has finished ***'
    exit 0
fi