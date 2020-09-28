#!/bin/bash
CLUSTER_NAME="Usama-usecase-ALB"
SERVICE_NAME="rest-crud-service"
TASK_FAMILY="rest-crud-task"
IMAGE=935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs:${GIT_COMMIT}

sed -e "s;IMAGE_VARIABLE;${IMAGE};g" rest-crud-task.json > rest-crud-task_${GIT_COMMIT}.json

aws ecs register-task-definition --family ${TASK_FAMILY} --cli-input-json file://rest-crud-task_${GIT_COMMIT}.json

TASK_REVISION=`aws ecs describe-task-definition --task-definition rest-crud-task | egrep "revision" | tr "/" " " | awk '{print $2}' | sed -e 's/,//'`
#DESIRED_COUNT=`aws ecs describe-services --services ${SERVICE_NAME} | egrep "desiredCount" | tr "/" " " | awk '{print $2}' | sed 's/,$//'`

aws ecs update-service --cluster ${CLUSTER_NAME} --service ${SERVICE_NAME} --task-definition ${TASK_FAMILY}:${TASK_REVISION} --desired-count 1 --force-new-deployment
