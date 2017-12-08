qsource=origin
fork=fork
start=`pwd`

rm -rf $source $fork
mkdir $source
cd $source
touch .gitignore
git init
git add -A
git commit -m "init"

cd $start
git clone $source $fork

cd $start
cd $source
touch 1.txt
git add 1.txt
git commit -m "add 1.txt"

cd $start
cd $fork
touch 2.txt
git add 2.txt
git commit -m "add 2.txt"
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
