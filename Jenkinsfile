pipeline {
    agent any
    // this is just basic structure for the jenkinsfile 

    environment {
        DOCKER_IMAGE = 'danez3/ensf400-courseproject:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'jenkins', url: 'https://github.com/d-anez3/ensf400-courseproject.git'
            }
        }

        stage('Build') {
            steps {
                sh 'gradle build'
            }
        }

        stage('Test') {
            steps {
                sh 'gradle test'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Docker Push') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying application..."
                sh 'docker run -d -p 8080:8080 $DOCKER_IMAGE'
            }
        }
    }
}
