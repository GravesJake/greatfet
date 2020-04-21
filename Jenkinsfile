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
                    echo "HOME:"
                    echo $HOME
                    echo "USER:"
                    echo $USER
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
                '''
            }
        }
    }
    post {
        always {
            echo 'One way or another, I have finished'
            // deleteDir() /* clean up our workspace */
        }
    }
}