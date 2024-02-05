pipeline {
    agent any
    environment {
        registry = "c1l2o3u4d5/todoappl"
        registryCredential = 'docker-hub-credentials'
        dockerImage = '' 
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building the ToDo application on Docker'
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Push') {
            steps {
                echo 'Pushing the ToDo application Docker image'
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application on Docker'
                script {
                    docker.image(dockerImage).withRun('-p 3000:3000')
                    // or use sh 'docker run -p 3000:3000 -d todoappl'
                }
            }
        }
    }
}
