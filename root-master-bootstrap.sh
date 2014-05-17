#!/bin/bash
set -x

SOURCE_BUCKET=aurea-nebula

aws s3 cp s3://$SOURCE_BUCKET/web-setup/etc/apache2/sites-available/aurea-nebula.adversary.us-ssl  /etc/apache2/sites-available/aurea-nebula.adversary.us-ssl
aws s3 cp s3://$SOURCE_BUCKET/web-setup/var/www/tcdirac-web/tcdirac-web.wsgi /var/www/tcdirac-web/tcdirac-web.wsgi
aws s3 cp s3://$SOURCE_BUCKET/web-setup/etc/apache2/ssl/aurea-nebula.crt /etc/apache2/ssl/aurea-nebula.crt
aws s3 cp s3://$SOURCE_BUCKET/web-setup/etc/apache2/ssl/aurea-nebula.key /etc/apache2/ssl/aurea-nebula.key

a2enmod ssl
a2dissite price.adversary.us-ssl || true
a2ensite aurea-nebula.adversary.us-ssl
service apache2 start || true
service apache2 reload || true
chown -R sgeadmin /var/log/apache2
python /home/sgeadmin/bin/elastic_ip.py
apt-get install exuberant-ctags
