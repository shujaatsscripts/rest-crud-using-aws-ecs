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
                    sh "chmod +x service-update.sh"
                    sh "./service-update.sh"
                }
            }
        }
        stage ('Cleaning Directories'){
            steps{
                script{
                    sh "docker system prune --all -f"
                    sh "rm -rf ./*"
                }
            }
        }
    }           
}
