set -eo pipefail

if [ -z "$1" ]; then
    echo "Usage:"
    echo "$0 0 - Build normally"
    echo "$0 1 - Build with vulnerability"
    exit
fi

if [ $1 == "1" ]; then
    TARGET='MICROECC_VULNERABLE'
else 
    TARGET='MICROECC'
fi

make PLATFORM=CWLITEARM CRYPTO_TARGET=$TARGET
