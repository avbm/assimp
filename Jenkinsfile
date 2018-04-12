pipeline {
    agent {
        docker { image 'jenkins_slave' }
    }
    parameters {
        string(defaultValue: 'HEAD', description: 'git ref to build', name: 'git_ref')
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

		sh '''cmake CMakeLists.txt -G 'Unix Makefiles'
		make
		make install

		RUN fpm -s dir -t deb --prefix /usr/local assimp'''
            }
        }
    }
}
