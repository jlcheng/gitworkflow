start=`pwd`
origin="$start/origin"
fork="$start/fork"

rm -rf $origin $fork
mkdir $origin
cd $origin
touch .gitignore
git init
git add -A
git commit -m "init"

cd $start
git clone $origin $fork

cd $origin
touch 1.txt
git add 1.txt
git commit -m "add 1.txt"

touch 2.txt
git add 2.txt
git commit -m "add 2.txt"

cd $fork
git fetch
git merge --ff-only --commit

git status
