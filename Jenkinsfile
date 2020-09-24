pipelien{
    agent any
    environment{
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
    stages {
        stage('Cloning Repository'){
            steps{
                checkout scm
            }
        }
        stage('Image Build){
            steps{

            }
        }
        stage ('Image Push){
            steps{

            }
        }
    }
}