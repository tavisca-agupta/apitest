pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		        powershell 'dotnet build -p:Configuration=release'
            }
        }
        stage('Publish') {
            steps {
                echo 'Publishing..'
		        powershell 'dotnet publish'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
		        powershell 'dotnet API/bin/Release/netcoreapp2.1/API.dll'
            }
        }
    }
}