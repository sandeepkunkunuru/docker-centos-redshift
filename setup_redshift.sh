#!/bin/bash

BASE=/tmp/setup

# Create the base temporary directory
mkdir $BASE
cd $BASE


# Download unixODBC
if ! wget ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.2.tar.gz; then
    echo 'Failed to download unixODBC!' 1>&2
    exit 1
fi

# Extract the files to a folder
tar -xvf unixODBC-2.3.2.tar.gz
cd unixODBC-2.3.2

# Build unixODBC to /usr/lib64
CPPFLAGS="-DSIZEOF_LONG_INT=8"
export CPPFLAGS

./configure --prefix=/usr --libdir=/usr/lib64 --sysconfdir=/etc --enable-gui=no --enable-drivers=no --enable-iconv --with-iconv-char-enc=UTF8
make
make install

if [ $? -ne 0 ]; then
    echo 'Failed to build unixODBC!' 1>&2
    exit 1
fi

# Create symbolic links so that MSSQL ODBC driver can find unixODBC
ln -s /usr/lib64/libodbcinst.so.2.0.0 /usr/lib64/libodbcinst.so.1
ln -s /usr/lib64/libodbc.so.2.0.0 /usr/lib64/libodbc.so.1

cd $BASE


# Download Redshift ODBC Driver RPM
if ! wget https://s3.amazonaws.com/redshift-downloads/drivers/AmazonRedshiftODBC-64bit-1.3.1.1000-1.x86_64.rpm; then
    echo 'Failed to download Redshift ODBC Driver!' 1>&2
    exit 1
fi

# Install the Redshift ODBC driver
yum --nogpgcheck localinstall -y AmazonRedshiftODBC-64bit-1.3.1.1000-1.x86_64.rpm




