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
                    sh "docker build -t 935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs:latest ./web-app/"
                }
            }
        }       
        stage('Image Push'){
            steps{
                script{
                    docker.withRegistry('https://935648617855.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:usama'){
                       sh "docker push 935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs:latest"
                    }
                }
            }
        }

    }           
}
