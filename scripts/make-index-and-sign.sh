#! /usr/bin/env bash

set -eu

usage_exit() {
        echo "Usage: $0 [-s USIGN_SECRET] TARGET_DIR" 1>&2
        exit 1
}

while getopts K:iv:s:h OPT
do
    case $OPT in
        s)  USIGN_SECRET_PATH=$OPTARG
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done

shift $((OPTIND - 1))

if [[ -v USIGN_SECRET_PATH ]] ; then
    USIGN_SECRET_PATH=$(realpath $USIGN_SECRET_PATH)
fi
TARGET_DIR=${1:-.}

export PATH=$HOME/sdk/staging_dir/host/bin/:$PATH

for dir in $(find $TARGET_DIR -name '*.ipk' -exec dirname {} \; | sort | uniq); do
    echo $dir
    cd $dir
    /home/openwrt/sdk/scripts/ipkg-make-index.sh . > ./Packages
    gzip -9c ./Packages > ./Packages.gz
    if [[ -v USIGN_SECRET_PATH ]] ; then
        usign -S -m ./Packages -s $USIGN_SECRET_PATH -x ./Packages.sig
        usign -S -m ./Packages.gz -s $USIGN_SECRET_PATH -x ./Packages.gz.sig
    fi
done
