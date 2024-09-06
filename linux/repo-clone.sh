echo "Working on $1 > $2"
cd $1
git fetch && git pull
git checkout develop
git status
git branch -a