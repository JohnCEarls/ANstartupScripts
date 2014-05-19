#!/bin/bash
set -x

#this script sets up the user settings how I like them
#vim/bash/github etc.
META_BUCKET=aurea-nebula
META_FOLDER=aws-meta/bootstrap-files/
META_TARGZ=bootstrap-user.tar.gz

HOME_DIR=/home/sgeadmin/
echo cd $HOME_DIR
cd $HOME_DIR

cp $HOME_DIR.ssh/authorized_keys $HOME_DIR.ssh/authorized_keys.bak
echo aws --region=us-east-1 s3 cp s3://$META_BUCKET/$META_FOLDER$META_TARGZ $HOME_DIR/$META_TARGZ
aws --region=us-east-1 s3 cp s3://$META_BUCKET/$META_FOLDER$META_TARGZ $HOME_DIR/$META_TARGZ
#add ssh settings
echo tar -zxvf $HOME_DIR/$META_TARGZ -C $HOME_DIR
tar -zxvf $HOME_DIR/$META_TARGZ -C $HOME_DIR
cat $HOME_DIR.ssh/authorized_keys.bak >> $HOME_DIR.ssh/authorized_keys

source .bashrc
rm -rf  $HOME_DIR/$META_TARGZ 
git clone gh:JohnCEarls/private-settings.git $HOME_DIR/private-settings

#set up vim
cd $HOME_DIR/private-settings
git fetch origin
git checkout -b aws-instances origin/aws-instances
git pull

cp .vimrc .bashrc  ../
git clone https://github.com/gmarik/vundle.git $HOME_DIR/.vim/bundle/vundle
echo | vim +BundleInstall +qall

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

pip install GitPython --user
