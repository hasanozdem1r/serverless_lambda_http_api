# Serverless Framework Python HTTP API on AWS

## Prerequisites

This project requires following installations, please make sure you have already installed

- docker & docker-compose
- pyenv (manage multiple python versions)
- poetry (manage 3rd party dependencies properly)
- nvm & npm & node (manage serverless and plugins required)
- vscode or any text editor
- pre-commit


## Localstack Installation

Install awscli local (awscli wrapper)
```bash
  pip install pip install awscli-local
```
Start Localstack with docker-compose
```bash
  (cd aws-localstack && docker-compose up -d)
```
Stop Localstack with docker-compose
```bash
  (cd aws-localstack && docker-compose down)
```


Install terraform local (terraform wrapper)
```bash
  pip install terraform-local
```
Initialize infrastructure
```bash
  (cd iac && tflocal init && tflocal apply)
```
Confirm docker container run status
```bash
  docker ps
```
## Serverless Installation

Install serverless
```bash
  nvm install 19.4.0
  nvm use 19.4.0
  npm install serverless
```
Install serverless plugins
```bash
  npm install serverless
  serverless plugin install -n serverless-localstack
  serverless plugin install -n serverless-python-requirements
  serverless plugin install -n serverless-iam-roles-per-function
```

Install Python 3.9.7 and set 3.9.7 default version
```bash
  pyenv install 3.9.7
  pyenv global 3.9.7
```
Activate venv and install dependencies (you are in project directory)
```bash
  poetry env use 3.9.7
  poetry shell
  poetry install
```

# Data Operations on PostgresSQL

PostgreSQL Shell Access
```bash
docker exec -it <container_id> psql -U pythonTest pythonTest /bin/bash
```



## Usage

## Deployment

```
$ serverless deploy
```

After deploying, you should see output similar to:

```bash
Deploying aws-python-http-api-project to stage dev (us-east-1)

✔ Service deployed to stack aws-python-http-api-project-dev (140s)

endpoint: GET - https://xxxxxxxxxx.execute-api.us-east-1.amazonaws.com/
functions:
  hello: aws-python-http-api-project-dev-hello (2.3 kB)
```

## Acknowledgements
Following people or resources helped me to understand and let me to apply best practices for this task
 - [Daria Chekmak](https://pl.linkedin.com/in/daria-chekmak-b026b8142)
 - [Boilerplate Python HTTP Api](https://github.com/yokharian/boilerplate-python-http-api)
 - AWS Community Day Resources
 - [Hasan Özdemir Project Template](https://github.com/hasanozdem1r/python_project_template)
