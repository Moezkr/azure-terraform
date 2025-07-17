pipeline {
    agent any

    tools {
        terraform 'terraform'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Moezkr/azure-terraform.git'
            }
        }

        stage('Azure Login') {
            steps {
                script {
                    bat 'az login --service-principal -u a1b2c3d4-5678-90ab-cdef-782649842ev -p Q9R4~FjskL3bY8ZnMwtXufZpKkq9Mp1avMFEYbYJ --tenant 98yunhfv-8956-8632-0mpl-mlo698742691'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }

        stage('Terraform Import') {
            steps {
                script {
                    def terraformState = bat(script: 'terraform state list', returnStdout: true).trim()
                    if (!terraformState.contains('azurerm_resource_group.example')) {
                        def resourceGroupExists = bat(script: 'az group show --name myResourceGroup', returnStatus: true) == 0
                        if (resourceGroupExists) {
                            echo 'Resource group already exists, importing it into Terraform state.'
                            bat 'terraform import azurerm_resource_group.example /subscriptions/879654xc-8963-897e-oim6-7e364x65879z0/resourceGroups/myResourceGroup'
                        } else {
                            echo 'Resource group does not exist, no import needed.'
                        }
                    } else {
                        echo 'Resource group is already managed by Terraform. Skipping import.'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                bat 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully.'
            mail to: 'moezkraiem5@gmail.com',
                 subject: 'Terraform Pipeline Success',
                 body: 'The pipeline was executed successfully and your infrastructure is up to date.'
        }
        failure {
            echo 'Pipeline execution failed.'
            mail to: 'moezkraiem5@gmail.com',
                 subject: 'Terraform Pipeline Failure',
                 body: 'Pipeline failed. Check Jenkins logs and Terraform plan for more details.'
        }
    }
}
