pipeline{
    agent any
    stages {
        stage('Cloning Repository'){
            steps{
                checkout scm
            }
        }
        stage('Image Build'){
            steps{
                script{
                docker.withRegistry('935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs', 'jenkins-aws-secret-key-id') {
                    git 'https://github.com/usamashujaat1812/rest-crud-using-aws-ecs'
                    docker.build('rest-crud-using-aws-ecs/web-app').push('latest')
                }
            }

        }
    }
}