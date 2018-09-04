#!/usr/bin/env bash

BASE_DIR=$(cd "$(dirname "$0")" && pwd)

ecol() {
    text="$1"; options="$2";
    [ -z "$2" ] && options="1;35";
    echo -e "\033[${options}m${text}\033[0m$3"
}

if which patchelf >/dev/null; then
    ecol "PatchELF is found"
else
    ecol "Get PatchELF ..."
    cd $BASE_DIR
    which curl >/dev/null || (ecol "Get curl ..." && sudo apt-get install curl)
    curl -O -L https://github.com/NixOS/patchelf/archive/0.9.tar.gz
    tar -zxf 0.9.tar.gz
    ecol "Install PatchELF ..."
    which autoconf >/dev/null || (ecol "Get autoconf ..." && sudo apt-get install autoconf)
    cd patchelf-0.9/
    ./bootstrap.sh
    ./configure
    make
    sudo make install
    ecol "Clean PatchELF ..."
    cd $BASE_DIR
    rm -f  0.9.tar.gz
    rm -rf patchelf-0.9/
fi

ecol "Change rpath ..."


# default rpath here
RPATH_OPENCV=/usr/local/lib

[ -z "$SDK_OpenCV_LIB_DIR" ] || RPATH_OPENCV=$SDK_OpenCV_LIB_DIR

# echo "RPATH_OPENCV:$RPATH_OPENCV"
# echo "RPATH_CUDA:$RPATH_CUDA"

# lib
patchelf --set-rpath $BASE_DIR/lib/3rdparty/DBoW2/lib/libDBoW2.so $BASE_DIR/lib/libPanoramaSLAM.so
patchelf --set-rpath $BASE_DIR/lib/3rdparty/g2o/lib/libg2o.so $BASE_DIR/lib/libPanoramaSLAM.so

# apps
patchelf --set-rpath $BASE_DIR/lib/3rdparty/DBoW2/lib/libDBoW2.so  $BASE_DIR/apps/panorama_slam
patchelf --set-rpath $BASE_DIR/lib/3rdparty/g2o/lib/libg2o.so  $BASE_DIR/apps/panorama_slam
patchelf --set-rpath $RPATH_OPENCV:$BASE_DIR/lib/libPanoramaSLAM.so $BASE_DIR/apps/panorama_slam

ecol "Change rpath done"



exit 0
