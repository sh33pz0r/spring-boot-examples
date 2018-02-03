pipeline {
  agent { label 'slave' }
  tools {
      maven 'Maven 3.3.9'
      }
  stages {
    stage('Send Slack Notifcation') {
        steps {
            slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }
    stage('Checkout') {
        steps {
            checkout scm
        }
    }
    stage('verify') {
      steps {
          dir("spring-boot-package-war"){
              sh 'mvn clean verify'
          }
      }
    }
    stage ('Build') {
        steps {
            sh 'mvn install'
        }
        post {
            success {
                junit 'target/surefire-reports/**/*.xml'
            }
        }
    }
  }
  post {
    success {
      slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }

    failure {
      slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }
  }
}
