start=$PWD
origin="$start/origin"

rm -rf $origin
mkdir $origin
cd $origin
touch 1.txt
echo "2" > 2.txt
git init
git add -A
git commit -m "init"

echo "1" > 1.txt
rm 2.txt
echo "3" > 3.txt
git diff-files --diff-filter=ADM
