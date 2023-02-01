#!/bin/bash

# GITHUB ACTION SHELL SCRIPT
# check whether serverless installed or not
if ! command -v serverless --help &> /dev/null
then
    echo "'serverless' could not be found";
    npm i -g serverless;
fi
# install required packages
serverless plugin install -n serverless-localstack; # https://www.serverless.com/plugins/serverless-localstack
serverless plugin install -n serverless-python-requirements; # https://www.serverless.com/plugins/serverless-python-requirements
serverless plugin install -n serverless-iam-roles-per-function; # https://www.serverless.com/plugins/serverless-iam-roles-per-function
serverless plugin install -n serverless-offline # https://www.serverless.com/plugins/serverless-offline
