pipeline {
    stages {
        stage('checkout_scm') {
            steps {
                checkout scm
            }
        }
        stage('build') {
            steps {
                sh "docker build ."
            }
        }
    }
}
