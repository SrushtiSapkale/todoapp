pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'todoapp'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from your version control system
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build env.DOCKER_IMAGE
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to a container registry (replace 'your-registry' with your actual registry)
                    docker.withRegistry('', 'docker-hub-credentials') {
                        docker.image(env.DOCKER_IMAGE).push()
                    }
                }
            }
        }

        stage('Deploy to Docker') {
            steps {
                script {
                    // Run the Docker container (replace 'your-container-name' with your actual container name)
                    docker.image(env.DOCKER_IMAGE).run('-p 8083:3000 --name todoapp -d')
                }
            }
        }
    }

    post {
        always {
            // Clean up: Remove the Docker container after the job finishes
            script {
                docker.image(env.DOCKER_IMAGE).remove()
            }
        }
    }
}

