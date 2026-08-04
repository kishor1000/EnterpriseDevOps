pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Repository already checked out by Jenkins'
            }
        }

        stage('Verify Environment') {
            steps {
                sh '''
                    whoami
                    pwd
                    git --version
                    g++ --version
                    cmake --version
                    python3 --version
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

        stage('Build') {
            steps {
                sh '''
                    cmake --build build
                '''
            }
        }

        stage('Run Calculator') {
            steps {
                sh '''
                    ./build/calculator
                '''
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'build/calculator', fingerprint: true
            }
        }

    }

}
