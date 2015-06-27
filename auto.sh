#!/bin/sh
#
#sh for miui patchrom
#EG:
#BUILD_NUMBER=5.5.13
#LAST_TARGET=last_target_files_5.5.8.zip(last make fullota with target files zip)
BUILD_NUMBER=$1
LAST_BUILD_NUMBER=$2
LAST_TARGET=$3
if [ $# != 2 ];then
    echo "Usage: ./auto_make.sh   BUILD_NUMBER  LAST_BUILD_NUMBER  LAST_TARGET"
    exit
fi
echo "******************"
echo "*Init Environment*"
echo "******************"
cd ..
. build/envsetup.sh
cd -
pwd
echo "******************"
echo "*     Clean      *"
echo "******************"
make clean
echo "******************"
echo "*     Fullota    *"
echo "******************"
make fullota BUILD_NUMBER=$BUILD_NUMBER
echo "******************"
echo "*Copy Fullota.zip*"
echo "******************"
cp out/fullota.zip miui_gee_justinxu_$BUILD_NUMBER.zip
echo "******************"
echo "*      OTA       *"
echo "******************"
echo "------------------"
echo "    make ota?     "
echo "------------------"
read
../tools/releasetools/ota_from_target_files -k ../build/security/testkey -i $LAST_TARGET out/target_files.zip OTA-$LAST_BUILD_NUMBER-to-$BUILD_NUMBER.zip
echo "******************"
echo "*Copy  Target.zip*"
echo "******************"
cp out/target_files.zip $BUILD_NUMBER-target.zip
echo "******************"
echo "*     Done!      *"
echo "******************"
