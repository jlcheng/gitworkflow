
Via https://stackoverflow.com/a/3278427


```
#!/bin/sh

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi
```

See https://stackoverflow.com/a/39848551 for more plumbing commands


Assuming that local is ahead of remote
```
# shows a list of new commits ahead of remote
$ git rev-list `git merge-base @ @{u}`..`git rev-parse @`
7083c93ced70cc7910e91de897bdf9f82f08dad6
485a95eacb3540c04a8b515ffb9bbf9f1cc799cd

# also (since we assume local is ahead of remote, the first column will always be 0)
$ git rev-list --left-right --count @{u}...@
0	1

# also (the .. notation is only interested in what's new on @)
$ git rev-list --left-right --count @{u}..@
7083...
485a...
```
