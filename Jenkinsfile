pipeline {
    agent any
    stages {
        environment{
            registry = 'todoappl'
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry( '', docker-hub-credentials) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                script {
                     sh 'docker run -p 8083:80 todoappl'
                    }
                }
            }
        }
    }
    
}
