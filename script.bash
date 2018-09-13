#!/bin/bash

FILES="./"

for f in "$FILES"*.log
do

        temp=${f//_/}
        temp=${temp:2:-10}

        dir1=${temp: -6:-2}
        dir2=${temp: -2:2}
        dir3=${temp//[0-9]/}

        dir=$dir1/$dir2/$dir3

        if [[ ! -e $dir ]]
        then
                mkdir -p $dir
        fi

        mv $f $dir
done
