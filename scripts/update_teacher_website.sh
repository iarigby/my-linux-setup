# https://www.tldp.org/LDP/abs/html/othertypesv.html
if [ "$1" ];
then
    cd ~/school/"$1"
    echo "moved to $(pwd)"
fi
mkdir -p tmp ppts docs pdfs
# https://stackoverflow.com/questions/793858/how-to-mkdir-only-if-a-dir-does-not-already-exist
url=$(cat .wget-url)
creds=""
user=$(cat .wget-user)
password=$(cat .wget-password)
if [ "$user" ];
then
   echo "user found"
   creds="--user=$user"
fi
if [ "$password" ];
then
   echo "password found"
   creds="$creds --password=$password"
fi
cd tmp
read -r -p "will get files from $url into $1 using $creds. Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]];
then
    wget $creds --mirror -np -nH -nd -L 1 $url -R "*.html*" -q --show-progress
    cp -n *.pdf ../pdfs
    # https://stackoverflow.com/questions/3548453/negative-matching-using-grep-match-lines-that-do-not-contain-foo
    ls | awk '!/.ppt/ && !/.doc/ && !/.pdf/ && !/.html/' | xargs -I {} cp {} ../
    libreoffice --headless --convert-to pdf --outdir ../docs *.doc* 
    libreoffice --headless --convert-to pdf --outdir ../ppts *.ppt*
else
    echo "aborting..."
fi

