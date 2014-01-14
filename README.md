php-xAP
=======

PHP bindings for Patrick Lidstone's xAP Library

WARNING: This is an in-development library, it will not be bug free and fully featured. Please email simon at ateb dot co dot uk if you have any problems, suggestions, questions or words of support.

Testing: Build with gcc version 4.6.3 (Debian 4.6.3-14+rpi1) Built against PHP 5.4.4

Prerequisites: You must have git, git-core, swig2.0, php5-dev, php5-cli and php5-common installed as well as the usual build tools gcc etc.

Get/setup repo:

    git clone https://github.com/JakDaniels/php-xAP
    cd php-xAP

Build & install with:

    ./build.sh

Check that the module loads:

    php -m

Look for the 'xAP' module in the list and that there are no errors (missing symbols etc at the top of the list).

The build script does the following things:

	1) Downloads the xAP library and hub (first time) from http://www.lidstone.net/
	2) Builds the xAP-HUB, which in turn builds the library
	3) Creates an interface file for SWIG using the xAP library header files
	4) Uses SWIG to create the PHP module source code and include files
	5) Builds the PHP module source and then installs the shared module library (using sudo)
