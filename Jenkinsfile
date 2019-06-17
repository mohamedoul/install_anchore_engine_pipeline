pipeline {
    agent {
        docker { image 'node:7-alpine' }
    }
    stages {

        stage('Install anchore engine') 
        {
        steps {
        sh '''
        mkdir ~/aevolume
        cd ~/aevolume
        docker pull docker.io/anchore/anchore-engine:latest
        docker create --name ae docker.io/anchore/anchore-engine:latest
        docker cp ae:/docker-compose.yaml ~/aevolume/docker-compose.yaml
        docker rm ae
        docker-compose pull
        docker-compose up -d
        '''
        }
    }
        stage('Test') {
        steps {
                sh  '/root/.local/bin/anchore-cli image list'
            }

        }
} 
}
