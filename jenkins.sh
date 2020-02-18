#!/bin/bash
GIT_COMMITER_NAME="CI Person"
GIT_COMMITER_EMAIL="ci@greatscottgadgets.com"
python3 -m venv env
. env/bin/activate
pip3 install --upgrade pip
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
deactivate
pushd firmware/build/greatfet_usb/
greatfet_firmware -w greatfet_usb.bin
popd