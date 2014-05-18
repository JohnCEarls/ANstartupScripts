#!/bin/bash
set -x
#Webserver initialization
service apache2 stop || true

SOURCE_BUCKET=aurea-nebula
thisfile=`basename $0`

if test "${thisfile#*dev}" = "$thisfile"; then
    SITE_NAME=aurea-nebula.adversary.us
else
    SITE_NAME=aurea-nebula-dev.adversary.us
fi

echo $BRANCH
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

#give the network settings time to propagate
sleep 60

service apache2 reload || true
