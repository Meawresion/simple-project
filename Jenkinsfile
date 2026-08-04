pipeline {

    agent any

    environment {

        IMAGE = "192.168.20.251:5000/simple-project"

    }

    stages {

        stage('Checkout') {

            steps {

                checkout scm

            }

        }

        stage('Build') {

            steps {

                sh '''
                podman build \
                    -t ${IMAGE}:latest .
                '''
            }

        }

        stage('Test') {

            steps {

                sh '''
                podman run --rm \
                    ${IMAGE}:latest \
                    ./run-tests.sh
                '''
            }

        }

        stage('Push') {

            steps {

                sh '''
                podman push \
                    --tls-verify=false \
                    ${IMAGE}:latest
                '''
            }

        }

        stage('Deploy') {

            steps {

                sh '''
                ansible-playbook \
                    -i ansible/inventory \
                    ansible/deploy.yml
                '''
            }

        }

    }

}