pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the ToDo application on Docker'
                sh 'docker build . -t todoappl'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application on Docker'
                sh 'docker run -p 3000:3000 -d todoappl'
            }
        }
    }
}
