pipeline {
    agent none
	stages {
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
		sh 'echo $HOME '
		sh 'pip install --user -r app/requirements.txt'
		sh 'pytest -q app/app_test.py' }
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
		stage('Build Image')
			{ 
				sh "docker build -t myapp ."
			}
		stage('deployment to container')
			{ 
				sh "docker-compose up"
			}
      
    }
}
