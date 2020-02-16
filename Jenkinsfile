pipeline {
    agent none
    stages {
	   	echo "$HOME"
		echo "GitHub BranhName ${env.BRANCH_NAME}"
		echo "Jenkins Job Number ${env.BUILD_NUMBER}"
		echo "Jenkins Node Name ${env.NODE_NAME}"
		echo "Jenkins Home ${env.JENKINS_HOME}"
		echo "Jenkins URL ${env.JENKINS_URL}"
		echo "JOB Name ${env.JOB_NAME}"
		echo "JOB Name ${env.WORKSPACE}"
		
        stage('Build') {
            agent {
                docker {
                    image 'python:2-alpine'
                }
            }
            steps {
                sh 'python -m py_compile app/app.py'
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'qnib/pytest'
                }
            }
            steps {
		withEnv(["HOME=${env.WORKSPACE}"]) {
		sh 'pip install --user -r app/requirements.txt'
                sh 'py.test --verbose --junit-xml test-reports/results.xml app/app_test.py' }
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
      
    }
}
