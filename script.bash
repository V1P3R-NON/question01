#!/bin/bash

A="A_(\d{8})_(\d{4}).*.log"
B="B_(\d{12}).*.log"
C="C_(\d{4})_(\d{2})_(\d{2}).*.log"

#Config Path
pathlogfile=".............."
targat=".............."

mkdir rawfile
mv $(find $pathlogfile -name "*"|grep -P "$A|$B|$C"| sed "s|^\./||") rawfile/

FILES="rawfile/"

for f in "$FILES"*.log
do

temp=${f//_/}
temp=${temp:7:-10}

echo $temp

dir1=${temp: -6:-2}
dir2=${temp: -2:2}
dir3=${temp//[0-9]/}

dir=$dir1/$dir2/$dir3
echo $dir
if [[ ! -e $dir ]]
then
mkdir -p $targat/$dir
fi

mv $f $targat/$dir

done
rm -rf rawfile
