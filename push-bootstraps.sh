#!/bin/bash

set -x
#download current bootstrap scripts
aws s3 cp user-bootstrap.sh s3://aurea-nebula/aws-meta/working-files/user-bootstrap.sh 
aws s3 cp data-bootstrap.sh s3://aurea-nebula/aws-meta/working-files/data-bootstrap.sh 
aws s3 cp master-bootstrap.sh s3://aurea-nebula/aws-meta/working-files/master-bootstrap.sh 
aws s3 cp web-bootstrap.sh  s3://aurea-nebula/aws-meta/working-files/web-bootstrap.sh 
aws s3 cp root-web-bootstrap.sh  s3://aurea-nebula/aws-meta/working-files/root-web-bootstrap.sh 
aws s3 cp gpu-bootstrap.sh s3://aurea-nebula/aws-meta/working-files/gpu-bootstrap.sh 
aws s3 cp create-keys.sh s3://aurea-nebula/aws-meta/working-files/create-keys.sh 
