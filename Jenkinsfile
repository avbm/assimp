pipeline {
    agent {
        node { label 'master' }
    }
    parameters {
        stringParam(defaultValue: 'HEAD', description: 'git ref to build', name: 'git_ref')
    }
    stages {
        stage('checkout_scm') {
            steps {
                checkout scm
                sh 'git checkout ${git_ref}'
            }
        }
        stage('build') {
            steps {
                sh "docker build ."
            }
        }
    }
}
