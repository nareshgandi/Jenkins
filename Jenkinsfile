pipeline {
    agent any
    
    environment {
        AWS_REGION = 'us-east-1'
        TF_CLI_ARGS = '-input=false'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            stage('Terraform Destroy') {
                steps {
                    script {
                        // Uncomment the following line to destroy the resources after testing
                        // sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
