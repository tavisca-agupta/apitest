pipeline {
    agent any

    parameters{
        string(
            name: "PROJECT_NAME",
            defaultValue: "API"
        )
        string(
            name:"DOCKER_IMAGE_NAME",
            defaultValue: "api",
            description:"Name of Docker Image"
        )
        string(
            name:"DOCKER_UNAME",
            defaultValue: "amgupta321",
            description:"Docker User Name"
        )
        password(
            name:"DOCKER_PASS",
            description:"Docker Password"
        )
    }
    stages 
    {
        stage('Build') {
            steps {
                echo 'Starting SonarQube'
                powershell "C:/Users/agupta/Downloads/sonarScanner/MSBuild.SonarQube.Runner.exe begin /d:sonar.login=admin /d:sonar.password=admin /k:'API'"
                echo 'Building..'
		        powershell 'dotnet build -p:Configuration=release'
            }
        }
        stage('Publish') {
            steps {
                echo 'Publishing..'
		        powershell 'dotnet publish -p:Configuration=release'
                echo 'SonarQube Ending'
                powershell 'C:/Users/agupta/Downloads/sonarScanner/MSBuild.SonarQube.Runner.exe end /d:sonar.login=admin /d:sonar.password=admin'

            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying using Docker....'
                powershell "docker login -u ${DOCKER_UNAME} -p ${DOCKER_PASS}"
                powershell "docker build -t ${DOCKER_UNAME}/${DOCKER_IMAGE_NAME} ."
                powershell "docker push ${DOCKER_UNAME}/${DOCKER_IMAGE_NAME}"
            }
        }
    }
}