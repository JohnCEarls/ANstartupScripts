#!/bin/bash
set -x

HOME_DIR=/home/sgeadmin

cd $HOME_DIR

GITHUB_REPO=gh:JohnCEarls/DataDirac.git
BRANCH=master
DEST_DIR=~/DataDirac

git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
git pull
python setup.py install --user
GITHUB_REPO=gh:jlafon/PynamoDB.git
BRANCH=master
DEST_DIR=~/PynamoDB

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
git pull
python setup.py install --user --verbose || true


GITHUB_REPO=gh:JohnCEarls/MasterDirac.git
BRANCH=master
DEST_DIR=~/MasterDirac

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
git pull
python setup.py install --user

GITHUB_REPO=gh:JohnCEarls/GPUDirac.git
BRANCH=master
DEST_DIR=~/GPUDirac

git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
python setup.py install --user
