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

git fetch origin
git merge --no-commit origin/master

if [ "$?" = "0" ]
then
    echo "rebase successful"
    git reset --hard
else
    echo "rebase failed"
    git merge --abort
fi

cd $start
