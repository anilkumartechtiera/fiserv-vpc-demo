pipeline {
  agent  any
    stages {

      stage ('Checkout SCM'){
        steps {
          checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'a9e88285-0aec-49e1-858e-4f2dc11442a9', url: 'https://github.com/anilkumartechtiera/fiserv-vpc-demo.git']]])
        }
      }

     
      stage('Set Terraform path') {
       steps {
         script {
            def tfHome = tool name: 'terraform'
            env.PATH = "${tfHome}:${env.PATH}"
         }
     }
  }
  stage('terraform init') {
 
       steps {
           dir ("vpc") {
                script {
                    withAWS(roleAccount:'965510773901', role:'TerraformAssumeRole', useNode: true) {
                    sh 'terraform init -no-color'
                    }
             }
           }
        }
      }

  stage('terraform Plan') {
 
       steps {
           dir ("vpc") {
            
               script {
                    withAWS(roleAccount:'965510773901', role:'TerraformAssumeRole', useNode: true) {
                    sh 'terraform plan -no-color -out=plan.out'
                    }
               }
            }
        }
      }

  stage('Waiting for Approvals') {
            
      steps{
          input('Plan Validated? Please approve to create VPC Network in AWS?')
			  }
      }    

  stage('terraform Apply') {
 
       steps {
           dir ("vpc") {
            
              script {
                    withAWS(roleAccount:'965510773901', role:'TerraformAssumeRole', useNode: true) {
                    sh 'terraform apply -no-color -auto-approve plan.out'
                    sh "terraform output"
                    }
              }
            
           }
        }
      }
   }
}
