def remote = [:]
remote.name = 'web server'
remote.host = '45.63.27.112'
remote.user = 'don'
remote.password = 'cypressjenkins'
remote.allowAnyHosts = true
pipeline {
  agent any
  
  environment {
    DISABLE_AUTH = 'true'
    DB_ENGINE    = 'sqlite'
  }
  
  stages {
    stage('Static Check') {
      steps {
        sh 'echo Static Check'
      }
    } 
    stage('Unit Testing') {
      steps {
        sh 'echo Unit Testing'
      }
    }
    stage('Cypress Integration Testing') {
      steps {
        sh 'echo Start Cypress Integration Testing'
        sh '[ ! -d "./learnCypress2" ] && echo "Directory /learnCypress2 does not exists" &&  git clone https://github.com/nzleoliang/learnCypress2.git'
        sh 'cd learnCypress2 && npm install && npx cypress run --spec ./cypress/integration/examples/action.spec.js'
      }
    }
    stage('Build Result Image') {
      steps {
        sh 'printenv'
        sh 'docker build -t nzleoliang/result ./result'
        echo 'Build result completed'
      }
    } 
    stage('Build Vote Image') {
      steps {
        sh 'docker build -t nzleoliang/vote ./vote'
      }
    }
    stage('Build Worker Image') {
      steps {
        sh 'docker build -t nzleoliang/worker ./worker'
      }
    }
    stage('E2E Testing') {
      steps {
        parallel(
          Chrome: {
            echo "This is branch a"
          },
          Firefox: {
            echo "This is branch b"
          },
          Safari: {
            echo "This is branch b"
          }
        )
      }    
    } 
    stage('Push Result Image') {
      when {
        expression {
          return env.GIT_BRANCH == "origin/master"
        }
      }
      steps {
        withDockerRegistry(credentialsId: 'dockerhubid', url:'') {
          sh 'docker push nzleoliang/result'
        }
      }
    }
    stage('Push Vote Image') {
      when {
        expression {
          return env.GIT_BRANCH == "origin/master"
        }
      }
      steps {
        withDockerRegistry(credentialsId: 'dockerhubid', url:'') {
          sh 'docker push nzleoliang/vote'
        }
      }
    }
    stage('Push Worker Image') {
      when {
        expression {
          return env.GIT_BRANCH == "origin/master"
        }
      }
      steps {
        withDockerRegistry(credentialsId: 'dockerhubid', url:'') {
          sh 'docker push nzleoliang/worker'
        }
      }
    }
    stage('Deployment') {
      steps {
        sshCommand remote: remote, command: 
        "cd /home/don/projects/example-voting-app && " +
        "git pull && " +
        "docker-compose pull && " +
        "docker-compose down && " +
        "docker-compose up -d && " + 
        "docker-compose ps" 
      }
    }
  }
}
