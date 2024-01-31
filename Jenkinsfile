pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          docker.build env.DOCKER_IMAGE
        }

      }
    }

    stage('Push Docker Image') {
      steps {
        script {
          docker.withRegistry('https://hub.docker.com/', 'docker-hub-credentials') {
            docker.image(env.DOCKER_IMAGE).push()
          }
        }

      }
    }

    stage('Deploy to Docker') {
      steps {
        script {
          docker.image(env.DOCKER_IMAGE).run('-p 8083:3000 --name todoapp -d')
        }

      }
    }

  }
  environment {
    DOCKER_IMAGE = 'todoappl'
  }
  post {
    always {
      script {
        docker.image(env.DOCKER_IMAGE).remove()
      }

    }

  }
}