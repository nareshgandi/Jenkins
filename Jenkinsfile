pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm               
            }
        }
        stage('Terraform Deploy') {
            steps {
                // Run Terraform commands to deploy infrastructure
                script {
                    sh '''
                        export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
                        export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
                        terraform init
                        terraform apply -auto-approve
                    '''
                }
            }
        }
        // Other stages for testing, etc.
    }

    post {
        always {
            // Cleanup or additional steps that should run regardless of success or failure
            script {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
