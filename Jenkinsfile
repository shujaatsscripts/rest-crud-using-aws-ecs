pipeline{
    environment {
        imagename = "rest-crud-using-aws-ecs"
        dockerImage = ''
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
                    sh "docker build -t rest-crud-using-aws-ecs:latest ./web-app/"
                }
            }
        }       
        stage('Image Push'){
            steps{
                script{
                    sh "aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 935648617855.dkr.ecr.us-east-2.amazonaws.com"
                    sh "docker tag rest-crud-using-aws-ecs:latest 935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs:latest"
                    sh "docker push 935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs:latest"
                }
            }
        }
    }           
}
