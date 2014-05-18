#!/bin/bash
set -x

HOME_DIR=/home/sgeadmin
BRANCH=master

cd $HOME_DIR

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


