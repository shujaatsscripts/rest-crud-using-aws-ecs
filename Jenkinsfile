pipeline{
    environment {
        GIT_COMMIT = ""
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning Repository'){
            steps{
                git([url: 'https://github.com/usamashujaat1812/rest-crud-using-aws-ecs.git', branch: 'master'])
                
                script{
                    sh "GIT_COMMIT = git log -1 --format=%h"
                }
            }
        }
        stage('Image Build'){
            steps{
                script{
                    sh "docker build -t 935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs:latest ./web-app/"
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
    }           
}
