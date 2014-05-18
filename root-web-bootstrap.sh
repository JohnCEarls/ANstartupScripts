#!/bin/bash
set -x
#Webserver initialization
SITE_NAME=aurea-nebula.adversary.us
SOURCE_BUCKET=aurea-nebula
aws s3 cp s3://$SOURCE_BUCKET/aws-meta/working-files/create-keys.sh .
#create ssl keys
bash create-keys.sh $SITE_NAME
cp $SITE_NAME.crt /etc/apache2/ssl/
cp $SITE_NAME.key /etc/apache2/ssl/

a2enmod ssl
a2ensite $SITE_NAME-ssl
#so sgeadmin can see the logs
chown -R sgeadmin /var/log/apache2
#connect elastic ip to this instance
python /home/sgeadmin/bin/elastic_ip.py $SITE_NAME

service apache2 start || true
service apache2 reload || true
