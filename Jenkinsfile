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
                    docker.withRegistry('', 'dockerID') {
                    def customImage = docker.build("lawrenceodedina/new:${env.BUILD_ID}")
                    def customImage1 = docker.build("lawrenceodedina/new")
                    customImage.push()
                    customImage1.push()
                    }
                }
              }
        }  
        }
    }