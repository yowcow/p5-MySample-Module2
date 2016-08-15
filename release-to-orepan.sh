#!/bin/bash

CWD=$(readlink -e $(dirname "$0"))

echo "--> CWD: $CWD"

DIST_NAME="$1"
OREPAN_DIR=$(readlink -e "$2")

echo "--> OrePAN dir: $OREPAN_DIR"

git submodule update --init $OREPAN_DIR

cd $OREPAN_DIR \
    && git checkout master \
    && git pull origin master

cd $CWD

FILE=$(find . -maxdepth 1 -name "$DIST_NAME-*.tar.gz" | sed -e 's/^\.\///' | sort -r | head -n1)
VERSION=$(echo "$FILE" | perl -ne 'm/([v0-9_\.]+)\./; print $1')

echo "--> Dist file: $FILE"
echo "--> Dist version: $VERSION"

if [ -e $FILE ] && [ -n $VERSION ]; then \
    [ -z $(find $OREPAN_DIR -name "$FILE") ] \
        && orepan2-inject $FILE $OREPAN_DIR \
    && cd $OREPAN_DIR \
        && git add . \
        && git commit -m "Add $DIST_NAME version $VERSION" \
        && git push origin master \
    && cd $CWD \
        && git add . \
        && git commit -m "Bump version to $VERSION" \
        && git push origin master \
        && git tag $VERSION \
        && git push origin $VERSION
fi
