#!/bin/bash

set -x
#download current bootstrap scripts
aws s3 cp s3://aurea-nebula/aws-meta/working-files/user-bootstrap.sh .
aws s3 cp s3://aurea-nebula/aws-meta/working-files/data-bootstrap.sh .
aws s3 cp s3://aurea-nebula/aws-meta/working-files/master-bootstrap.sh .
aws s3 cp s3://aurea-nebula/aws-meta/working-files/root-master-bootstrap.sh .
aws s3 cp s3://aurea-nebula/aws-meta/working-files/gpu-bootstrap.sh .

