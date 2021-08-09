if [[ -z $1 ]]; then echo Usage: `basename "$0"` [list of files to check]; exit 2; fi

#use file descriptor 6
while read -u 6 filepath;
do
    if [ -n "$filepath" ]; then
        if ! [[ -f $filepath ]]; then
	    echo "$filepath" does not exist!
	    failflag=1
        fi
    fi
done 6<$1

if [[ $failflag -eq 1 ]]; then
	echo FAIL: Not all files were found
	exit 1
else
	echo SUCCESS: All files found!
fi
