origin=origin
fork=fork
start=`pwd`

rm -rf $origin $fork
mkdir $origin
cd $origin
touch .gitignore
git init
git add -A
git commit -m "init"

cd $start
git clone $origin $fork

cd $start
cd $origin
echo "one" > new.txt
git add new.txt
git commit -m "add one to new.txt"

cd $start
cd $fork
echo "two" > new.txt
git add new.txt
git commit -m "add two to new.txt"
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
