#!/bin/bash
export GRADLE_HOME=/opt/gradle/gradle-6.9.2
export PATH=${GRADLE_HOME}/bin:${PATH}

mkdir /home/vscode/.gradle
echo "mavenRepoParkingplusComBrUsername=gabriel.freitas" > /home/vscode/.gradle/gradle.properties
echo "mavenRepoParkingplusComBrPassword=Sysadmin#3" >> /home/vscode/.gradle/gradle.properties
gradle build