pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		bat 'dotnet build -p:Configuration=release'
            }
        }
        stage('Publish') {
            steps {
                echo 'Publishing..'
		bat 'dotnet publish'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
		bat 'dotnet API/bin/Release/netcoreapp2.1/API.dll'
            }
        }
    }
}