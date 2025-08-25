pipeline {
   agent any

   environment {
      IMAGE_NAME = "simpleweb"
      CONTAINER_NAME = "simplewebcont"
      HOST_PORT = "8085"
      CONTAINER_PORT = "80"
   }

   stages {
      stage('Checkout') {
         steps {
            git branch: 'master', url:'https://github.com/Curiousgoal202/Prpject1.git'
         }
      }

      stage('Build Docker Image') {
         steps {
            sh """
            docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .
            """
         }
      }

      stage('Stop Old Container') {
         steps {
            sh """
            docker rm -f ${CONTAINER_NAME} || true
            """
         }
      }

      stage('Run New Container') {
         steps {
            sh """
            docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} ${IMAGE_NAME}:${BUILD_NUMBER}
            """
         }
      }
   }

   post {
      success {
         echo "✅ Website deployed successfully on http://http://13.62.45.125/:${HOST_PORT}"
      }
      failure {
         echo "❌ Build failed. Please check logs."
      }
   }
}
