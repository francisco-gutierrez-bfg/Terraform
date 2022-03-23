# BUILD & AUTOMATE LOCAL (ON PREM) DOCKER INFRASTRUCTURE USING TERRAFORM


## TABLE OF CONTENTS

* Introduction
* Requirements
* How To
* Maintainers


## INTRODUCTION

This is a simple example but enough to understand the concept and use it as a start point for more complex projects.
Terraform not only works with cloud environments, it can be used to automate on prem infrastructure.
The purpose of this code is to build a local Docker Container from local terraform.
Terraform will be using the local docker provider (previously installed over an onprem server)


## REQUIREMENTS

- Ubuntu OS as main platform.
- Docker must be installed.
- Terraform >= 1.x


## HOW TO

Docker build from Terraform locally (both, Docker and Terraform):

1- Install Terraform: 

       $ sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

   Add the HashiCorp GPG key.  
   
       $ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

   Add the official HashiCorp Linux repository. 
   
       $ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

   Update to add the repository, and install the Terraform CLI.  
   
       $ sudo apt-get update && sudo apt-get install terraform

   TIP: Now that you have added the HashiCorp repository, you can install Vault, Consul, Nomad and Packer with the same command.  

2- Install Terraform autocomplete package: 

       $ terraform -install-autocomplete  

3- Install Docker  

4- Create a Directory for Docker projects (Dockerfiles).  

5- Create a directory for Terraform plans.  

6- Now, create a container from terraform, two different examples below:  
 
a) Creating a container from a NGINX prebuilt image:  

       terraform {
         required_providers {
           docker = {
             source = "kreuzwerker/docker"
           }
         }
        }

       provider "docker" {}

       resource "docker_image" "nginx" {
         name         = "nginx:latest"
         keep_locally = false
       }

       resource "docker_container" "nginx" {
         image = docker_image.nginx.latest
         name  = "tutorial"
         ports {
           internal = 80
           external = 8000
         }
       }

b) Create a container from an image you built (custom):

   - First create an image from your Dockerfile:
     Dokcer file content:

         FROM centos:latest
         MAINTAINER Jdoe
         RUN yum -y install httpd
         COPY index.html /var/www/html/
         CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
         EXPOSE 80
  
   - Then, create a sample app, in this case a basic html file (call it index.html) in the same location as Dockerfile:
 
         <!DOCTYPE html>
         <html>
          <body>
           <h1>Building test from Terraform</h1>
           <h2>https://www.github.com/</h2>
          </body>
         </html>

   - Then, create an image from your Dockerfile:
   
         docker build -t terraformtest .

7- Finally run terraform in order to build the new container:

   Go to your terraform file, in this case it's called main.tf,
   and it's located at "TERRAFORM_CODE/":
   Run: terraform init
        terraform fmt (to fix the file format)
        terraform validate (to check code)
        terraform plan (to precheck your new infra code)
        terraform apply (to apply and build your new infra)

   Sample App is located next to Dockerfile, App is called "index.html"

   1- Run a build from the Dockerfile located at "DOCKER_CODE/TESTAPP/"  
   2- Now you are ready to deploy a container with terraform, please make sure to modify
      the following parameters based on your needs:  


       provider "docker" {}

          resource "docker_container" "terraformtest" {
           image = "terraformtest:latest"  <------ Change this parameter upon your needs
           name  = "terraformtest"
           restart = "always"
           ports {
            internal = 80 <------ Change this parameter upon your needs
            external = 80 <------ Change this parameter upon your needs
           }
          }


## MAINTAINERS

### Current Maintainers:
--------------------
 * Francisco Gutiérrez Gutiérrez.  
   Sr. Unix/Linux Engineer.  
   ingenierialinuxpereira@gmail.com
