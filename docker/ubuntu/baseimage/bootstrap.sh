#!/usr/bin/env bash

# for linux-libc-dev:i386, which is needed by LuaJIT
dpkg --add-architecture i386

apt-get update

KINDLE_TC="gcc-arm-linux-gnueabi g++-arm-linux-gnueabi"
KOBO_TC="gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf"
LIB32_GCC_DEV="lib32gcc-4.8-dev libx32gcc1 libx32gomp1 libx32itm1 "`
             `"libx32atomic1 libx32asan0 libx32quadmath0 libc6-x32"
MISC_TOOLS="git subversion zip unzip vim wget"
LUAJIT_DEPS="$LIB32_GCC_DEV libc6-dev-amd64:i386"
GLIB_DEPS="gettext"

echo " ------------------------------------------"
echo "| installing dependencies..."
echo "| $LUAJIT_DEPS "
echo " ------------------------------------------"
apt-get install -y \
	$MISC_TOOLS \
	build-essential dpkg-dev \
	gcc-4.8 cpp-4.8 g++-4.8 make automake cmake ccache \
	patch libtool nasm autoconf2.64 \
	$GLIB_DEPS \
	$KINDLE_TC $KOBO_TC \
	$LUAJIT_DEPS \
	libsdl2-dev
