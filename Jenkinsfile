pipeline {
    agent { docker { image 'python:3.7.5' } }
    environment {
        GIT_COMMITER_NAME = 'CI Person'
        GIT_COMMITER_EMAIL = 'ci@greatscottgadgets.com'
    }
    stages {
        stage('prerequisites') {
            steps {
                // cmakeBuild buildDir: 'build', cleanBuild: true, installation: 'InSearchPath', sourceDir: 'firmware/'
                sh '''#!/bin/bash
                pwd
                ls
                mkdir tmp
                tar -xvf cmake-3.17.0-rc1-Linux-x86_64.tar.gz -C tmp/
                cd tmp/cmake-3.17.0-rc1-Linux-x86_64/
                ./configure --prefix=/opt/cmake
                make
                make install
                /opt/cmake/bin/cmake -version
                '''
                sh '''#!/bin/bash
                python3 -m venv virtualenv
                . virtualenv/bin/activate
                pip3 install --upgrade pip
                pip3 install PyYAML
                deactivate
                '''
            }
        }
        stage('build') {
            steps {
                sh '''#!/bin/bash
                    echo $HOME
                    echo $USER
                    . virtualenv/bin/activate
                    pushd libgreat/host/
                    python3 setup.py build
                    python3 setup.py install
                    popd
                    pushd host/
                    python3 setup.py build
                    python3 setup.py install
                    popd
                    make firmware
                    deactivate
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