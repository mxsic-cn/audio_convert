#!/bin/bash
# convertor hna cw

deeperFile() {
	dirname=$1
	echo  $dirname
	IFS=$'\n'
	for file in ./*
		do
		    if test -d $file
		    then
	    		cd $file
	        	deeperFile `pwd`
	        	cd ../
	    	else
	    		if [ "${file##*.}" = "flac" -o "${file##*.}" = "FLAC" ];
	    		then
					echo ${file} ${file%.*}.wav
					ffmpeg -i ${file} ${file%.*}.wav
					rm ${file}
				fi
		    fi
		done
}
 

DIR=/Users/xxx/temp/flac
cd $DIR
deeperFile $DIR
echo 'all done'
