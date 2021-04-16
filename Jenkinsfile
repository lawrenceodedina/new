pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
     triggers {
        pollSCM'* * * * *'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean'
                sh 'mvn install'
                sh 'mvn package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                script {
                    checkout scm
                    app=docker.build("femiodedina/new")
                    docker.withRegistry('', dockerID){
                        app.push("$env.BUILD_NUMBER")
                        app.push("latest")
                    }
                }
              }
        }
    }