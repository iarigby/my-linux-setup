#cd path/to/project-b
mkdir "$1"
cd "$1"
git remote add "$1" "$2"
git fetch "$1" --tags
git merge --allow-unrelated-histories "$1"/master # or whichever branch you want to merge
git remote remove "$1"

