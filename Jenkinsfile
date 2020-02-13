pipeline {
  agent { docker { image 'python:3.7.2' } }
  stages {
    stage('build') {
      steps {
        sh 'python3.7 -m  pip install --user -r app/requirements.txt'
       
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
