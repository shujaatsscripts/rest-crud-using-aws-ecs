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
                
                    dockerimage = docker.build imagename
                }
            }
        }
        stage('Image Push'){
            steps{
                script{
                    docker.withRegistry('935648617855.dkr.ecr.us-east-2.amazonaws.com/rest-crud-using-aws-ecs', credential('jenkins-aws-secret-key-id')) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                }
            }
        }           
    }
}
