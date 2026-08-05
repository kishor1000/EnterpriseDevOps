pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Environment Verification') {
            steps {
                sh '''
                echo "===== Environment ====="

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

        stage('Configure Build') {
            steps {
                sh '''
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

        stage('Archive Binary') {
            steps {
                archiveArtifacts artifacts: 'build/calculator', fingerprint: true
            }
        }

    }

}

