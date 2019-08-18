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
                echo 'Deploying using Docker....'
                powershell 'docker build -t apiimage .'
		        powershell 'docker run --rm -p 8888:5555 apiimage'
            }
        }
    }
}