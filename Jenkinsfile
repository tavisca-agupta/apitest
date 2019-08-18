pipeline {
    agent any

    parameters{
        string(
            name: "PROJECT_NAME",
            defaultValue: "API"
        )
        string(
            name:"DOCKER_IMAGE_NAME",
            description:"Name of Docker Image"
        )
        string(
            name:"DOCKER_UNAME",
            description:"Docker User Name"
        )
        string(
            name:"DOCKER_PASS",
            description:"Docker Password"
        )
    }
    stages 
    {
        stage('Build') {
            steps {
                echo 'Building..'
		        powershell 'dotnet build -p:Configuration=release'
            }
        }
        stage('Publish') {
            steps {
                echo 'Publishing..'
		        powershell 'dotnet publish -p:Configuration=release'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying using Docker....'
                powershell 'docker build -t ${DOCKER_IMAGE_NAME} .'
                powershell 'docker login -u ${DOCKER_UNAME} -p ${DOCKER_PASS}'
                powershell 'docker push ${DOCKER_UNAME}/${PROJECT_NAME}'
            }
        }
    }
}