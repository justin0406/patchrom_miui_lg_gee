#!/bin/sh
#
#sh for miui patchrom
#EG:
#BUILD_NUMBER=5.5.13
#LAST_TARGET=last_target_files_5.5.8.zip(last make fullota with target files zip)
BUILD_NUMBER=$1
LAST_BUILD_NUMBER=$2
LAST_TARGET=$3
if [ $# != 3 ];then
    echo "Usage: ./auto_make.sh   BUILD_NUMBER  LAST_BUILD_NUMBER  LAST_TARGET"
    exit
fi
cd ..
. build/envsetup.sh
cd -
pwd
make clean
make fullota BUILD_NUMBER=$BUILD_NUMBER
cp out/fullota.zip miui_gee_justinxu_$BUILD_NUMBER.zip
read
../tools/releasetools/ota_from_target_files -k ../build/security/testkey -i $LAST_TARGET out/target_files.zip OTA-$LAST_BUILD_NUMBER-to-$BUILD_NUMBER.zip
cp out/target_files.zip $BUILD_NUMBER.zip
make clean
echo "******************"
echo "*     Done!      *"
echo "******************"


