pipeline{
    agent {
        docker {
            image 'docker:stable'
        }
    }
    environment {
        IMAGE_NAME = 'btodhunter/anchore-ci-demo'
        IMAGE_TAG = 'jenkins'
    }
    stages {
        stage('Build Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:ci .'
            }
        }
        stage('Scan') {
            steps {        
                sh 'apk add bash curl'
                sh 'curl -s https://ci-tools.anchore.io/inline_scan-v0.3.3 | bash -s -- -d Dockerfile -b .anchore_policy.json ${IMAGE_NAME}:ci'
            }
        }

    }
}
