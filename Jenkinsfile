pipeline {
  environment {
    M3_HOME = "/usr/share/maven"
    M2_HOME = "/usr/share/maven"
  }
  agent { label 'slave' }
  tools {
      maven 'Maven 3.3.9'
      jdk 'jdk8'
  }
  stages {
    // stage('Send Slack Notifcation') {
    //     steps {
    //         slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    //     }
    // }
    stage('verify') {
      steps {
          dir("spring-boot-package-war"){
              sh 'echo $PATH'  
              sh 'mvn clean verify'
          }
      }
    }
    stage ('Build') {
        steps {
          dir("spring-boot-package-war"){
            sh 'mvn clean install'
        }
        post {
            success {
                junit 'target/surefire-reports/**/*.xml'
            }
        }
        }
    }
  }
//   post {
//     success {
//       slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
//     }

//     failure {
//       slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
//     }
//   }
}
