pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/Hbz-one/PFE-2020.git', branch:'To_test'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("hbzone/carrental-img:${env.BUILD_ID}")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    
    stage('Deploy App') {
      steps {
          sshagent(['K8S_Master']) {
          sh "scp -o StrictHostKeyChecking=no carrental.yml ubuntu@13.36.39.128:/home/ubuntu"
          script {
              try{
                  sh "ssh ubuntu@13.36.39.128 kubectl create -f ."
              }catch(error){
                  sh "ssh ubuntu@13.36.39.128 kubectl create -f ."
        }
      }
    }
    }
    }
  }

}
