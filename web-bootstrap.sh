#!/bin/bash
set -x

HOME_DIR=/home/sgeadmin

cd $HOME_DIR

rm -rf $HOME_DIR/.local/lib || true

BRANCH=master

GITHUB_REPO=gh:JohnCEarls/DataDirac.git
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

git clone $GITHUB_REPO ~/bin
cd ~/bin
git fetch
git checkout $BRANCH
git pull
chmod u+x ~/bin/elastic_ip.py


GITHUB_REPO=gh:JohnCEarls/MasterDirac.git
DEST_DIR=~/MasterDirac
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
git pull
python setup.py install --user
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit

GITHUB_REPO=gh:JohnCEarls/tcdiracweb.git
DEST_DIR=~/tcdiracweb

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git checkout $BRANCH
git pull
python setup.py install --user
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit

#these do not change
GITHUB_REPO=gh:JohnCEarls/StarCluster
BRANCH=mydevelop-iam
DEST_DIR=~/StarCluster

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch 
git checkout $BRANCH
git pull
python setup.py install --user
cp scripts/post-commit .git/hooks
chmod u+x .git/hooks/post-commit

GITHUB_REPO=gh:JohnCEarls/starcluster-plugins
BRANCH=master
DEST_DIR=~/starcluster-plugins

rm -rf $DEST_DIR || true
git clone $GITHUB_REPO $DEST_DIR
cd $DEST_DIR
git fetch
git pull
git checkout $BRANCH

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
