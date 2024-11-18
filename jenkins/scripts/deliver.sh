#!/usr/bin/env bash

echo 'The following Maven command installs your Maven-built Java application'
echo 'into the local Maven repository, which will ultimately be stored in'
echo 'Jenkins''s local Maven repository (and the "maven-repository" Docker data'
echo 'volume).'
set -x
mvn jar:jar install:install help:evaluate -Dexpression=project.name
set +x

echo 'The following command extracts the value of the <name/> element'
echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
set -x
NAME=$(mvn -q -Dstyle.color=never help:evaluate -Dexpression=project.name | tr -d '\r' | tr -d '\n' | tr -d '[:cntrl:]')
set +x

echo 'The following command behaves similarly to the previous one but'
echo 'extracts the value of the <version/> element within <project/> instead.'
set -x
VERSION=$(mvn -q -Dstyle.color=never help:evaluate -Dexpression=project.version | tr -d '\r' | tr -d '\n' | tr -d '[:cntrl:]')
set +x

echo 'Resolved project name and version:'
echo "Project Name: ${NAME}"
echo "Project Version: ${VERSION}"

echo 'The following command runs and outputs the execution of your Java'
echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
set -x
JAR_PATH="target/${NAME}-${VERSION}.jar"
if [ ! -f "$JAR_PATH" ]; then
    echo "Error: JAR file not found at ${JAR_PATH}. Listing target/ directory:"
    ls -la target
    exit 1
fi
java -jar "$JAR_PATH"
