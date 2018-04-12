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
		fpm -s dir -t deb -C /usr/local --name assimp
                dpkg -i assimp_1.0_amd64.deb'''
            }
        }
    }
}
