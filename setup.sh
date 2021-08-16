#!/bin/bash
DUPLICUTDIR=~/opt/duplicut
HATECRACKDIR=/opt/hatecrack
WORDLISTTEMPDIR=~/_temphatecrackwordlists
WORDLISTFINALDIR=/opt/seclists-ordered
WORDLISTPACKEDFILE=$WORDLISTFINALDIR/seclists-ordered.txt

echo 'Checking that all the files exist...'
if ! (./checkfiles.sh ordered-wordlists.txt); then
	echo 'Not all Seclist files in ordered-wordlists.txt found. Before running this script you must install the SecLists, extract rockyou.txt from its archive,'
	echo 'and make sure the locations of the files on disk match those of ordered-wordlists.txt'
	echo 'e.g.'
	echo 'git clone https://github.com/danielmiessler/SecLists /opt/SecLists'
	echo 'tar -xvf /opt/SecLists/Passwords/Leaked-Databases/rockyou.txt.tar.gz -C /opt/SecLists/Passwords/Leaked-Databases'
	exit 1;
fi

echo 'Installing duplicut... (it might be already installed, just ignore the errors in that case!)'
git clone https://github.com/nil0x42/duplicut $DUPLICUTDIR && cd $DUPLICUTDIR && make

echo 'Installing hatecrack'
git clone https://github.com/trustedsec/hate_crack.git $HATECRACKDIR

# write catted wordlists to temp file
echo 'Writing catted wordlists to temp file...'
mkdir -p $WORDLISTTEMPDIR
cat ordered-wordlists.txt | xargs cat > $WORDLISTTEMPDIR/seclists-catted.txt

echo "Here are the number of lines in the temp file (before being duplicutted)"
wc -l  $WORDLISTTEMPDIR/seclists-catted.txt

# duplicut the mega-list
echo 'Duplicutting the temp file...'
mkdir -p $WORDLISTFINALDIR
$DUPLICUTDIR/duplicut $WORDLISTTEMPDIR/seclists-catted.txt -o $WORDLISTPACKEDFILE

echo "Here are the number of lines in $WORDLISTPACKEDFILE (should not be zero)"
wc -l $WORDLISTPACKEDFILE

echo "Removing wordlist $WORDLISTTEMPDIR/seclists-catted.txt ..."
rm $WORDLISTTEMPDIR/seclists-catted.txt

echo "Finished"


