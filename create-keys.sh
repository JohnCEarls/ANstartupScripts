#!/bin/bash
 
#Required
domain=$1
commonname=$domain
 
#Change to your company details
country=US
state=IL
locality=Seattle
organization=Institute For Systems Biology
organizationalunit=Price Lab
email=john.c.earls+ansite@gmail.com
 
#Optional
password=dummypassword
 
if [ -z "$domain" ]
then
    echo "Argument not present."
    echo "Useage $0 [common name]"
 
    exit 99
fi
 
echo "Generating key request for $domain"
 
#Generate a key
openssl genrsa -des3 -passout pass:$password -out $domain.key 1024 -noout
 
#Remove passphrase from the key. Comment the line out to keep the passphrase
 
#Create the request
echo "Creating CSR"
openssl req -new -key $domain.key -out $domain.csr -passin pass:$password \
    -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"

echo "Removing passphrase from key"
openssl rsa -in $domain.key -passin pass:$password -out $domain.key
openssl x509 -req -days 365 -in $domain.csr -signkey $domain.key -out $domain.crt
