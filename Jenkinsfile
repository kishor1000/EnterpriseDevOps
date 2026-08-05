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
                export PATH=$PATH:/var/jenkins_home/.local/bin
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
                export PATH=$PATH:/var/jenkins_home/.local/bin
                conan profile detect --force
                conan install . --build=missing
                '''
            }
        }

        stage('Configure Build') {
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

        stage('Build Docker Image') {
	    steps {
        	sh '''
        	docker build -t calculator:v1 .
        	'''
    	    }
	}

	stage('Run Docker Container') {
	    steps {
       		 sh '''
        	docker run --rm calculator:v1
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

