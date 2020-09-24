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
                
                    dockerimage = docker.build "rest-crud-using-aws-ecs"
            }
        stage('Image Push'){
            steps{
                script{
                docker.withRegistry('935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs', 'jenkins-aws-secret-key-id') {
                    dockerImage.push("$BUILD_NUMBER")
                    dockerImage.push('latest')
                }
            }

        }
    }
}