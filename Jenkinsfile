pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Talhahassan01/depot-exemple.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'echo "Running on Unix"'
                        sh 'javac HelloWorld.java'
                        sh 'java HelloWorld'
                        sh 'python3 hello.py'
                    } else {
                        bat 'echo "Running on Windows"'
                        bat 'javac HelloWorld.java'
                        bat 'java HelloWorld'
                        bat 'python hello.py'
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t mon-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker rm -f mon-container || true'
                sh 'docker run -d --name mon-container mon-app'
            }
        }
    }
}
``