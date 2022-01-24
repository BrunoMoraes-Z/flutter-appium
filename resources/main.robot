*** Settings ***
########################################################
##                Libraries
########################################################

Library           ./libs/AppiumFlutterLibrary.py
Library           String
Library           DateTime
Library           Collections

########################################################
##                Resources
########################################################

Resource          ./locators.robot
Resource          ./keywords.robot

*** Variables ***
${APK}            ${CURDIR}/data/app-debug.apk
${DEVICE}         emulator-5554
