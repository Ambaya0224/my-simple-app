pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Setup Environment') {
            steps {
                sh '''
                python3 -m venv venv
                ./venv/bin/pip install --upgrade pip
                if [ -f requirements.txt ]; then
                    ./venv/bin/pip install -r requirements.txt
                else
                    ./venv/bin/pip install pytest  # Default packages if no requirements.txt
                fi
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                ./venv/bin/pytest
                '''
            }
        }
    }

    post {
        always {
            echo 'Build completed'
        }
        failure {
            echo 'Build failed'
        }
    }
}
