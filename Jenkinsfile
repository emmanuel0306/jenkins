pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh './jenkins/build.$GLOBAL_EXTENTION'
      }
    }

    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            sh './jenkins/test-frontend.$GLOBAL_EXTENTION'
          }
        }

        stage('back') {
          steps {
            sh './jenkins/test-backend.$GLOBAL_EXTENTION'
          }
        }

        stage('performance') {
          steps {
            sh './jenkins/test-performance.sh'
          }
        }

      }
    }

    stage('Ambiente') {
      environment {
        STAGE_EXTENTION = 'sh'
      }
      steps {
        echo 'variables de ambiente ----->'
        echo "variable ${GLOBAL_EXTENTION}"
        echo "variable ${STAGE_EXTENTION}"
        sh 'printenv'
        echo '<----- variables de ambiente'
      }
    }

    stage('Dinamicas') {
      environment {
        DEBUG_FLAGS = '-g'
      }
      steps {
        sh 'printenv'
      }
    }

  }
  environment {
    GLOBAL_EXTENTION = 'sh'
    CC = """${sh(
                        returnStdout: true,
                        script: 'echo "clang"'
                      )}"""
      EXIT_STATUS = """${sh(
                              returnStatus: true,
                              script: 'exit 1'
                            )}"""
      }
    }