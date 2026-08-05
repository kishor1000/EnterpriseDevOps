pipeline {

    agent any

    environment {
        PATH = "/var/jenkins_home/.local/bin:${env.PATH}"
        IMAGE_NAME = "calculator"
        IMAGE_TAG = "v1"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify Environment') {
            steps {
                sh '''
                whoami
                pwd

                git --version
                python3 --version
                conan --version
                g++ --version
                cmake --version
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                conan profile detect --force
                conan install . --build=missing
                '''
            }
        }

        stage('Configure') {
            steps {
                sh '''
                rm -rf build
                cmake -S . -B build
                '''
            }
        }

        stage('Compile') {
            steps {
                sh '''
                cmake --build build
                '''
            }
        }

        stage('Run Application') {
            steps {
                sh '''
                ./build/calculator
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker run --rm ${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }

        stage('Archive Binary') {
            steps {
                archiveArtifacts artifacts: 'build/calculator', fingerprint: true
            }
        }

    }

    post {

        always {
            echo "Pipeline Completed"
        }

        success {
            echo "Pipeline Successful"
        }

        failure {
            echo "Pipeline Failed"
        }

    }

}

