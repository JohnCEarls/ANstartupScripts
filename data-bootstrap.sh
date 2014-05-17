#!/bin/bash
set -x

HOME_DIR=/home/sgeadmin

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
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit

cd $HOME_DIR

GITHUB_REPO=gh:JohnCEarls/DataDirac.git
BRANCH=master
DEST_DIR=~/DataDirac

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
git pull
python setup.py install --user
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit
GITHUB_REPO=gh:JohnCEarls/data-bin.git
BRANCH=master

git clone $GITHUB_REPO ~/bin
cd ~/bin
git fetch
git checkout $BRANCH
git pull

chmod u+x *.py
chmod u+x *.sh

cd $HOME_DIR

rm -rf $HOME_DIR/notebooks
git clone gh:JohnCEarls/ipynotebooks.git $HOME_DIR/notebooks
cd $HOME_DIR/notebooks
git fetch
git checkout master

cd $HOME_DIR
mkdir $HOME_DIR/.matplotlib

source .bashrc
if [[ "$HOSTNAME" =~ .*master ]]; then
    cd ~/bin
    ./mpi-bootstrap.sh
    mv mpi.hosts ../
fi

GITHUB_REPO=gh:JohnCEarls/PynamoDB.git
BRANCH=master
DEST_DIR=~/PynamoDB

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
git pull
python setup.py install --user --verbose || true
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit 
