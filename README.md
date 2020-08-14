This repository which is mainly for creating the vitural machine in Azure platform. This code will create 2 private VM and 1 public connected VM (For login purpose)

Before you starting this you need to learn basic thing for Azure and create one new account in Azure platform by using following link https://azure.microsoft.com/en-us/free/ for leaning purpose. 

Once you created the Azure account, We need to do some basic setup for connecting Azure api by using terraform script. Please follow the link https://www.terraform.io/docs/providers/azurerm/guides/azure_cli.html for basic setup. 

Also Please install the terraform on your local or where you are going to execute the terraform script. You can use the following link to install terraform https://www.terraform.io/downloads.html

Now every thing is done. Let me explain about the code. 

Well.. In oder to create VM, we need to create some basic resources to full fill the infrasturacture.
1. Resouce Group.
2. Virtual Network.
3. Subnet's.
4. Network Interface.
5. Public ip's

In this code all the resources created as module. So the main idea is to reuse the code for multiple infrasturacture.

Azure_VM/Terraform/main.tf & Azure_VM/Terraform/variables.tf These files will change the each infrasturacture, other will be the same.

How to run the terraform code?

1. First clone this repo into your local
2. Navigate into Azure_VM/Terraform folder.
3. First you need to initialized the terraform module by using the below command
    terraform init
4. If you what to view the outcome of this code, you need to run the following commmand
    terraform plan
5. Creating the VM, Please run the below command.
    terraform apply auto-approve
    ** This will ask to user to provide the subscription_id and tenant_id. Since it's secure one that's why i'm getting from user. May be we have multiple motthod for apply the terraform. But i'm using this method.

In this repo, I have created some script to monitor our instance. Please navigate the folder Azure/vm_metrics/

1. If you want the metrics from local machine & ansible not there on that machine. Then please run the Ansible_installation.sh.
2. Once Ansible installed on that server, We need some softwere to get the basic system monitoring like CPU usage, Disk Uasge and Network Usage. So please execute the below command.
    ansible-playbook Monitoring_Package.yml 
3. After install required packages, Please execute below command to get the metrics date.
    ansible-playbook Monitoring_Metrics.yml

Note: ** if you are trying to get the metrics from differnt server the  you need to create one inventory file and that inventory you need to mentioned all the ip's look like below example

File : Azure_VM/vm_metrics/inventory

Content of the file will be

[metricsip]
10.0.1.5
10.0.1.4


How to execute the metrics ansible script?

1. If you're going to connect remote hosts by using username & password then please use the below command.
    ansible-playbook Monitoring_Metrics.yml -i inventory -e "ansible_user=########" -e "ansible_password=#########"
2. If it's password less authentication the use simple below one.
    ansible-playbook Monitoring_Metrics.yml -i inventory





