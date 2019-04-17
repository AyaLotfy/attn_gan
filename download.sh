FILE=$1

if [ $FILE == "celeba" ]; then
    __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    # CelebA images
    URL=https://drive.google.com/file/d/1SSnOlN3Usp9nLYKRyUtRYfYMhiovPOOb/view?usp=sharing
    ZIP_FILE=./data/CelebA_nocrop.zip
    mkdir -p ./data/
    ${__dir}/gd.sh $URL $ZIP_FILE
    unzip -q -o $ZIP_FILE -d ./data/ | awk 'BEGIN {ORS=" "} {if(NR%10==0)print "."}'
    rm $ZIP_FILE


else
    echo "Available arguments are celeba."
    exit 1
fi
