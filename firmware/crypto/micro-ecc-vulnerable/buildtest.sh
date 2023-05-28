set -eo pipefail

if [ -z "$1" ]; then
    echo "Usage:"
    echo "$0 0 - Build normally"
    echo "$0 1 - Build with vulnerability"
    exit
fi

if [ $1 == "1" ]; then
    INCLUDE="."
else 
    INCLUDE="../micro-ecc"
fi

gcc -I$INCLUDE -g -DuECC_ENABLE_VLI_API=1 -DTESTING=1 -DuECC_WORD_SIZE=4 test.c -o testprogram
