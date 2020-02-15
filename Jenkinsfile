pipeline {
    agent { docker { image 'python:3.7.5' } }
    environment {
        HOME = '${env.WORKSPACE}'
        GIT_COMMITER_NAME = 'CI Person'
        GIT_COMMITER_EMAIL = 'ci@greatscottgadgets.com'
    }
    stages {
        stage('build') {
            steps {
                sh '''#!/bin/bash
                    pushd libgreat/host/
                    python3 setup.py build
                    python3 setup.py install --user
                    popd
                    pushd host/
                    python3 setup.py build
                    python3 setup.py install --user
                    popd
                    make firmware
                '''
            }
        }
    }
}