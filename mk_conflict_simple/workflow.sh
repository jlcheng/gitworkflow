start=`pwd`
origin=$start/origin
fork=$start/fork


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

echo "three" > new.txt
git add new.txt
git commit -m "add three to new.txt"

cd $start
cd $fork
echo "two" > new.txt
git add new.txt
git commit -m "add two to new.txt"
git fetch origin
git rebase origin/master

if [ "$?" = "0" ]
then
    echo "rebase successful"
else
    echo "rebase failed"
    git rebase --abort
fi

cd $fork
