#!/bin/bash

# check whether serverless installed or not
if ! command -v serverless --help &> /dev/null
then
    echo "'serverless' could not be found";
    nvm use 19.4.0;
    npm install serverless;
fi
# install required packages
serverless plugin install -n serverless-localstack;
serverless plugin install -n serverless-python-requirements;
serverless plugin install -n serverless-iam-roles-per-function;
serverless plugin install -n serverless-dotenv-plugin;
