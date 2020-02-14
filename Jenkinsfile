pipeline {
  agent { docker { image 'python:2.7' } }
  stages {
    stage('build') {
      steps {
        sh '/usr/bin/pip3 install --user -r app/requirements.txt'
       
         }
    }
    stage('test') {
      steps {
        sh 'python app_test.py'
      }
      post {
        always {
          junit 'test-reports/*.xml'
        }
      }    
    }
  }
}
