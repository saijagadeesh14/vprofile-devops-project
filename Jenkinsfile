pipeline {
    agent any

    environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Build WAR') {
            steps {
                sh '''
                docker run --rm \
                -u root \
                -v $(pwd):/app \
                -w /app \
                maven:3.9-eclipse-temurin-8 \
                mvn clean package -DskipTests
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t saijagadeesh14/vprofile-app:${IMAGE_TAG} ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    docker push saijagadeesh14/vprofile-app:${IMAGE_TAG}
                    '''
                }
            }
        }
    }
}
