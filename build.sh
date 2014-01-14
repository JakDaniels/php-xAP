#!/bin/bash

outfile="xAP.i"

if [ ! -f xaplib_14.zip ]; then
	echo "Downloading xAPLib Source...."
	wget -O xaplib_14.zip "http://www.lidstone.net/xaplib_14.zip"
	wget -O xap-hub_src.zip "http://www.lidstone.net/xap-hub_src.zip"
fi

if [ ! -d xaplib ]; then
	mkdir xaplib
	echo "Unpacking xAPLib Source...."
	unzip -d xaplib xaplib_14.zip
fi

if [ ! -d xaphub ]; then
	mkdir xaphub
	echo "Unpacking xAPHub Source...."
	unzip -d xaphub xap-hub_src.zip
fi

cd xaphub
echo "Compiling and installing xAPHub and xAPLib...."
[ ! -f Makefile.old ] && mv Makefile Makefile.old
cat Makefile.old |sed -e s%OS=win32%OS=linux%g >Makefile
make xap-hub
cd ..

echo "Using SWIG to create PHP module source...."
swig -php $outfile

echo "Compiling PHP module source...."
gcc `php-config --includes` -fpic -c xAP_wrap.c

gcc -shared xAP_wrap.o xaphub/xapinit.o xaphub/xaprx.o xaphub/xaptx.o -o xAP.so

echo "Copying xPL.so to PHP extensions dir..."
echo "extension=`php-config --extension-dir`/xAP.so" >xAP.ini

sudo cp -f xAP.so `php-config --extension-dir`/
sudo cp -f xAP.ini /etc/php5/conf.d/91-xAP.ini
sudo chown root:root `php-config --extension-dir`/xAP.so /etc/php5/conf.d/91-xAP.ini

echo "There is a xAP.php include file that loads the module and provides a xAP class."
echo "DONE!"

