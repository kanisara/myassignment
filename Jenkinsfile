pipeline {
  agent { docker { image 'python:2.7' } }
  stages {
    stage('build') {
      steps {
		echo "$HOME"
		echo "GitHub BranhName ${env.BRANCH_NAME}"
		echo "Jenkins Job Number ${env.BUILD_NUMBER}"
		echo "Jenkins Node Name ${env.NODE_NAME}"
		echo "Jenkins Home ${env.JENKINS_HOME}"
		echo "Jenkins URL ${env.JENKINS_URL}"
		echo "JOB Name ${env.JOB_NAME}"
		echo "JOB Name ${env.WORKSPACE}"
		withEnv(["HOME=${env.WORKSPACE}"]) {
					sh 'pip install --user -r app/requirements.txt'
					sh 'python -m py_compile app/app.py '
				}
            }
    }
    stage('test') {
	     steps {
        sh 'python app/app_test.py'
      }
      post {
        always {
          junit 'test-reports/*.xml'
        }
      }    
    }
  }
}
