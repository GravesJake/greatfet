pipeline {
    agent { docker { image 'python:3.5.1' } }
    environment {
        GIT_COMMITER_NAME = 'CI Person'
        GIT_COMMITER_EMAIL = 'ci@greatscottgadgets.com'
    }
    stages {
        stage('build') {
            steps {
                sh '''#!/bin/bash
                    pushd libgreat/host/
                    python setup.py build
                    sudo python3 setup.py install
                    popd
                    pushd host/
                    python setup.py build
                    sudo python3 setup.py install
                    popd
                    make firmware
                '''
            }
        }
    }
}