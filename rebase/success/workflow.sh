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

cd $fork
touch 2.txt
git add 2.txt
git commit -m "add 2.txt"

cd $origin
touch 3.txt
git add 3.txt
git commit -m "add 3.txt"

cd $fork
touch 4.txt
git add 4.txt
git commit -m "add 4.txt"

git fetch origin
git rebase origin/master

if [ "$?" = "0" ]
then
    echo "rebase successful"
else
    echo "rebase failed"
    git rebase --abort
fi

cd $start
