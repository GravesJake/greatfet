pipeline {
    agent { dockerfile true }
    environment {
        GIT_COMMITER_NAME = 'CI Person'
        GIT_COMMITER_EMAIL = 'ci@greatscottgadgets.com'
    }
    stages {
        stage('build') {
            steps {
                sh '''#!/bin/bash
                    python3 -m venv virtualenv
                    . virtualenv/bin/activate
                    git submodule init
                    git submodule update
                    pip3 install PyYAML
                    pushd libgreat/host/
                    python3 setup.py build
                    python3 setup.py install
                    popd
                    pushd host/
                    python3 setup.py build
                    python3 setup.py install
                    popd
                    make firmware
                    pushd firmware/build/greatfet_usb/
                    greatfet_firmware -w greatfet_usb.bin -R
                    deactivate
                    rm -rf venv
                '''
            }
        }
    }
    post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
        }
    }
}