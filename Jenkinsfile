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
                docker.withRegistry('935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs', 'jenkins-aws-secret-key-id') {
                docker.build('rest-crud-using-aws-ecs/web-app').push('latest')
            }
        }
    }
}