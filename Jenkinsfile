pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'python:3.7.2'
                }
            }
            steps {
                sh 'pip install -r app/requirements.txt'
				        sh 'python -m py_compile app/app.py '
				
            }
        }
       
    }
}

