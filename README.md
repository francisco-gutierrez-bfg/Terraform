
# BUILD & AUTOMATE INFRASTRUCTURE COMPONENTS


## TABLE OF CONTENTS

* Introduction
* Requirements
* Repo details
* Maintainers

## INTRODUCTION

This is part of the effort to implement a repo where infrastructure components like VMs, Containers (Docker, Kubernetes), Cloud Functions, etc, can be built and updated, using tools like Terraform, Docker, Ansible, GCP conf management, and deploy them to different cloud providers.

Additionally scheduled tasks like patching, security scanning and reboots, can be implemnted using the same tools.

## REQUIREMENTS

- Linux environment 
- Terrafom >= 1.0.11 
- Docker
- Ansible
- GCloud CLI
- GitHub Client

## REPO DETAILS

There are two folders, each one is intended to be used to place specific configurations and builds.

> Ex:

  - DOCKER: This folder will place all builds, configs and tasks related to containers, including GKE containers.
  - TERRAFORM: This folder will place all builds related to infrastructure and GCP or other clud providers configurations,
                 This will include Ansible and/or GCP configuration Management tool.

## MAINTAINERS

### Current Maintainers:
--------------------
 * Francisco Gutiérrez Gutiérrez.  
   Sr. Unix/Linux Engineer.  
   ingenierialinuxpereira@gmail.com
