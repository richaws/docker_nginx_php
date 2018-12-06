pipeline {
  agent { label 'docker' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  triggers {
    cron('@daily')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -f "Dockerfile" -t esvirskiy/nginx-php:latest .'
      }
    }
    stage('Publish') {
      when {
        branch 'master'
      }
      steps {
	 // withDockerRegistry([ credentialsId: "6533de7e-17a4-4376-969b-e86bc1e4f903", url: "" ]) {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {

          sh 'docker push esvirskiy/nginx-php:latest'
	}
      }
    }
  }
}
