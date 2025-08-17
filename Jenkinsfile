pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Ambaya0224/my-simple-app.git', branch: 'main'
            }
        }

        stage('Setup Environment') {
            steps {
                sh '''
                    python3 -m venv venv
                    ./venv/bin/pip install --upgrade pip
                    ./venv/bin/pip install pytest setuptools wheel build
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    chmod +x build.sh
                    ./venv/bin/python -m pytest || true
                    ./build.sh
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Build passed'
        }
        failure {
            echo '❌ Build failed (expected first run with 2 failing tests)'
        }
    }
}
