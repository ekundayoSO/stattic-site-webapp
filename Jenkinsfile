pipeline {
    agent any
    environment {
      MAVEN_OPTS="--add-opens java.base/java.lang=ALL-UNNAMED"   
    }    

    stages {   
        stage('Build with maven') {
            steps {
                sh 'cd SampleWebApp && mvn clean install'
            }
        }
        
             stage('Test') {
            steps {
                sh 'cd SampleWebApp && mvn test'
            }
        
            }
        stage('Code Qualty Scan') {

           steps {
                  withSonarQubeEnv('sonar_server') {
 

             sh "mvn -f SampleWebApp/pom.xml sonar:sonar"      
               }
            }
       }
        stage('Quality Gate') {
          steps {
                 waitForQualityGate abortPipeline: true
              }
        }
        stage('deploy to tomcat') {
          steps {
             deploy adapters: [tomcat9(credentialsId: 'tompass', path: '', url: 'http://0.0.0.0:8080/')], contextPath: 'myapp', war: '**/*.war'
            // deploy adapters: [tomcat9(credentialsId: 'tompass', path: '', url: 'http://3.84.176.190:8080/')], contextPath: 'monolithicApp', war: '**/*.war'               
              
          }
            
        }
            
        }
    }
