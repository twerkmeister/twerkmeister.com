#!/bin/bash

set -e 

source .AWS_CREDENTIALS

bundle exec middleman build
bundle exec middleman s3_sync