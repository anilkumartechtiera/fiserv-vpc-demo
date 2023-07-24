pipeline {
    agent any
    
    environment {
        ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        GITHUB_PASSWORD = credentials('GITHUB_REPO_PASSWORD')
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Replace 'your-github-username' and 'your-repo-name' with your actual GitHub repository details
                git credentialsId: 'a9e88285-0aec-49e1-858e-4f2dc11442a9', url: 'https://github.com/anilkumartechtiera/fiserv-vpc-demo.git'
            }
        }
        
        stage('Terraform Plan') {
            steps {
                sh 'terraform init'
                sh 'terraform plan -var="access_key=${ACCESS_KEY_ID}" -var="secret_key=${SECRET_ACCESS_KEY}"'
            }
        }
        
        stage('Terraform Apply') {
            when {
                // Add any condition to control when to execute the apply stage
                // For example, manually approve after the plan stage
                expression { return true }
            }
            steps {
                sh 'terraform apply -auto-approve -var="access_key=${ACCESS_KEY_ID}" -var="secret_key=${SECRET_ACCESS_KEY}"'
            }
        }
    }
}

