DUPLICUTDIR=~/opt/duplicut
HATECRACKDIR=/opt/hatecrack
WORDLISTTEMPDIR=~/_temphatecrackwordlists
WORDLISTFINALDIR=/opt/SecLists/Passwords/optimized_wordlists
WORDLISTPACKEDFILE=$WORDLISTFINALDIR/seclists_packed.txt

echo 'Installing duplicut... (it might be already installed, just ignore the errors in that case!)'
git clone https://github.com/nil0x42/duplicut $DUPLICUTDIR && cd $DUPLICUTDIR && make

echo 'Installing hatecrack'
git clone https://github.com/trustedsec/hate_crack.git $HATECRACKDIR

# write catted wordlists to temp file
echo 'Writing catted wordlists to temp file...'
mkdir -p $WORDLISTTEMPDIR
cat ordered-wordlists.txt | xargs cat > $WORDLISTTEMPDIR/seclists-catted.txt

# duplicut the mega-list
echo 'Duplicutting the temp file...'
mkdir -p $WORDLISTFINALDIR
$DUPLICUTDIR/duplicut $WORDLISTTEMPDIR/seclists-catted.txt -o $WORDLISTPACKEDFILE

echo "Here are the number of lines in $WORDLISTPACKEDFILE"
wc -l $WORDLISTPACKEDFILE

echo "Don't forget to remove the temp wordlist $WORDLISTTEMPDIR/seclists-catted.txt"


