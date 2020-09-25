pipeline{
    environment {
        SERVICE_NAME="rest-crud-service"
        TASK_FAMILY="rest-crud-task"
        IMAGE=''
    }
    agent any
    stages {
        stage('Cloning Repository'){
            steps{
                git([url: 'https://github.com/usamashujaat1812/rest-crud-using-aws-ecs.git', branch: 'master'])
            }
        }
        stage('Image Build'){
            steps{
                script{
                    sh "docker build -t 935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs:${GIT_COMMIT} ./web-app/"
                    IMAGE="935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs:${GIT_COMMIT}"
                }
            }
        }       
        stage('Image Push'){
            steps{
                script{
                    docker.withRegistry('https://935648617855.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:usama'){
                       sh "docker push 935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs:${GIT_COMMIT}"
                    }
                }
            }
        }
        stage('Service update'){
            steps{
                script{
                    sh "sed -i 's/IMAGE_VARIABLE/${IMAGE}/g' rest-crud-task.json > rest-crud-task_${GIT_COMMIT}.json"
                    sh "aws ecs register-task-definition --family TASK_FAMILY --cli-input-json ./rest-crud-task_${GIT_COMMIT}.json"
                    TASK_REVISION= sh "aws ecs describe-task-definition --task-definition rest-crud-task | egrep "revision" | tr "/" " " | awk '{print $2}' | sed 's/"$//' "
                    DESIRED_COUNT= sh "aws ecs describe-services --services ${SERVICE_NAME} | egrep "desiredCount" | tr "/" " " | awk '{print $2}' | sed 's/,$//' "
                    sh "aws ecs update-service --cluster default --service ${SERVICE_NAME} --task-definition ${TASK_FAMILY}:${TASK_REVISION} --desired-count ${DESIRED_COUNT}"
                }
            }
        }
    }           
}
