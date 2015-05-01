#usage: ./Fullota.sh 4.8.21
# !/bin/sh
DATE=$1
MODEL=gee
cd ..
. build/envsetup.sh 
cd -
make clean
make fullota BUILD_NUMBER=$DATE
mv  out/fullota.zip ./miui_"$MODEL"_justinxu_"$DATE".zip
