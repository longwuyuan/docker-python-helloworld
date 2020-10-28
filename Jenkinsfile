pipeline {
    agent {
        kubernetes {
            cloud 'kubernetes'
            inheritFrom ' '
            namespace 'jenkins'
            yaml """
kind: Pod
metadata:
  name: jnlp
spec:
  containers:
  - name: jnlp
    image: longwuyuan/jenkins-jnlp-agent-podman:latest
    imagePullPolicy: Always
    tty: true
  restartPolicy: Never
"""
        }
    }
    stages {
        stage("Checkout src") {
            steps {
                git 'https://github.com/ngallot/docker-python-helloworld'
            }
        }
        stage("Check podman") {
            steps {
                sh 'whoami && pwd && ls -l'
                sh 'podman --storage-driver vfs info'
            }
        }
    }
}
