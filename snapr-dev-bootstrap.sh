#!/bin/bash
set -x

HOME_DIR=/home/sgeadmin
thisfile=`basename $0`

if test "${thisfile#*dev}" = "$thisfile"; then
    BRANCH=master
else
    BRANCH=develop
fi

echo $BRANCH

cd $HOME_DIR

$SNAPR_BRANCH=master
GITHUB_REPO=gh:PriceLab/snapr.git
DEST_DIR=~/snapr
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $SNAPR_BRANCH
git pull
make -j
cp $DEST_DIR/snapr $HOME_DIR/.local/bin


GITHUB_REPO=gh:JohnCEarls/AN-snapr.git
DEST_DIR=~/AN-snapr

git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
git pull
python setup.py install --user
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit

GITHUB_REPO=gh:JohnCEarls/DataDirac.git
DEST_DIR=~/DataDirac

git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
git pull
python setup.py install --user
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit

GITHUB_REPO=gh:JohnCEarls/MasterDirac.git
DEST_DIR=~/MasterDirac

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
git pull
python setup.py install --user
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit

GITHUB_REPO=gh:JohnCEarls/GPUDirac.git
DEST_DIR=~/GPUDirac

git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
python setup.py install --user
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit


