#!/bin/bash
set -x

HOME_DIR=/home/sgeadmin

BRANCH=develop

GITHUB_REPO=gh:JohnCEarls/MasterDirac.git
DEST_DIR=~/MasterDirac

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch --all
git checkout $BRANCH
git pull
python setup.py install --user
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit

cd $HOME_DIR

GITHUB_REPO=gh:JohnCEarls/DataDirac.git
DEST_DIR=~/DataDirac

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch --all
git checkout $BRANCH
git pull
python setup.py install --user
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit

GITHUB_REPO=gh:JohnCEarls/data-bin.git

git clone $GITHUB_REPO ~/bin
cd ~/bin
git fetch --all
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

