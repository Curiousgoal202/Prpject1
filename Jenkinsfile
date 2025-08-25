pipeline{
   agent any
             tools{
                   maven 'Maven3'
                   }
         environment{
                   IMAGE_NAME = "server"
                 CONTAINER_NAME = "servercont1"
                 HOST_PORT = "8085"
              CONTAINER_PORT = "80"
                     }
        stages{
             stage('checkout'){
                    steps{
                          git branch: 'master', url:'https://github.com/Curiousgoal202/Prpject1.git'
                          }
                       }
             stage('Build'){
                    steps{
                        sh 'mvn clean package'
                        }
                    }
             stage('Test'){
                    steps{
                       sh 'mvn test'
                        }
                     }
             stage('Build Docker Image'){
                    steps{
                      sh  """ 
                        docker build -t ${env.IMAGE_NAME}:${env.BUILD_NUMBER} .
                         """
                           }
                      }
             stage('Stop Old Container'){
                       steps{
                         sh """
                          docker rm -f ${CONTAINER_NAME} || true
                            """
                               }
                            }
             stage('Run New Container'){
                         steps{
                         sh """
                           docker run -d --name ${env.CONTAINER_NAME} -p ${env.HOST_PORT}:${env.CONTAINER_PORT} ${env.IMAGE_NAME}:${env.BUILD_NUMBER}
                           """      
                                 }
                            }
              }
                     post {
                            success {
                                  echo "Website deployed on http://13.62.45.125:${env.HOST_PORT}"
                                     }
                            }
                              failure {
                                  echo "Build failed. Please check logs"
                                       }
                                     }
                                  }
                           
 

 
