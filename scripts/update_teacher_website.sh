# https://www.tldp.org/LDP/abs/html/othertypesv.html
if [ "$1" ];
then
    cd ~/school/"$1"
    echo "moved to $(pwd)"
fi
mkdir -p tmp ppts docs pdfs
# https://stackoverflow.com/questions/793858/how-to-mkdir-only-if-a-dir-does-not-already-exist
url=$(cat .wget-url)
cd tmp
read -r -p "will get files from $url into $1. Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    wget --mirror -np -nH -nd -L 1 $url -R "*.html*" -q --show-progress
    cp -n *.pdf ../pdfs
    # https://stackoverflow.com/questions/3548453/negative-matching-using-grep-match-lines-that-do-not-contain-foo
    ls | awk '!/.ppt/ && !/.doc/ && !/.pdf/ && !/.html/' | xargs -I {} mv {} ../
    libreoffice --headless --convert-to pdf --outdir ../docs *.doc* 
    libreoffice --headless --convert-to pdf --outdir ../ppts *.ppt*
else
    echo "aborting..."
fi

