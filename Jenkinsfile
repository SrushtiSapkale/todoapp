pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the ToDo application on Docker'
                def env = docker.build 'todoappl'
            }
        }
        stage('Push') {
            steps {
                echo 'Building the ToDo application on Docker'
                env.push()
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application on Docker'
                docker.image('todoappl').withRun('-p 3000:3000')
                //sh 'docker run -p 3000:3000 -d todoappl'
            }
        }
    }
}
