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
                    docker.withRegistry('', dockerID){
                    def app=docker.build("femiodedina/new:$env.BUILD_ID")
                    def app1=docker.build("femiodedina/new")
                    app.push()
                    app1.push("latest")
                    }
                }
              }
        }
    }
}