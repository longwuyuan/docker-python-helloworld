// Uses Declarative syntax to run commands inside a container.
pipeline {
    agent {
        kubernetes {
            // Rather than inline YAML, in a multibranch Pipeline you could use: yamlFile 'jenkins-pod.yaml'
            // Or, to avoid YAML:
            // containerTemplate {
            //     name 'shell'
            //     image 'ubuntu'
            //     command 'sleep'
            //     args 'infinity'
            // }
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: shell
    image: longwuyuan/podman
    command:
    - sleep
    args:
    - infinity
'''
            // Can also wrap individual steps:
            // container('shell') {
            //     sh 'hostname'
            // }
            defaultContainer 'shell'
        }
    }
    stages {
        stage('Main') {
            steps {
                sh 'hostname'
                sh 'ls -l /'
                git 'https://github.com/longwuyuan/docker-python-helloworld.git'
                sh 'echo "Testing if podman build works"'
                sh 'podman --storage-driver vfs --runroot /home/jenkins/ --root /home/jenkins images '
                sh 'whoami && id jenkins && pwd && ls -al && echo WORKSPACE=$WORKSPACE'
                sh 'podman --storage-driver vfs --runroot /home/jenkins/ --root /home/jenkins build -t test-podman-build -f $WORKSPACE/Dockerfile.testbuild.'
                sh 'podman --storage-driver vfs --runroot /home/jenkins/ --root /home/jenkins images '
                sh 'podman --storage-driver vfs --runroot /home/jenkins/ --root /home/jenkins build -t docker-python-helloworld .'
                sh 'podman --storage-driver vfs --runroot /home/jenkins/ --root /home/jenkins images '
            }
        }
    }
}
