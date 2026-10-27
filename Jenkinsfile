pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Test HTML Form') {
            steps {
                bat 'powershell -NoProfile -ExecutionPolicy Bypass -File test.ps1'
            }
        }
    }

    post {
        success {
            echo 'SUCCESS: HTML form tests passed.'
        }
        failure {
            echo 'FAILURE: Check the console output for the error.'
        }
    }
}
