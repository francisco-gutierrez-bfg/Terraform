terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_container" "terraformtest" {
  image = "terraformtest:latest"
  name  = "terraformtest"
  restart = "always"
  ports {
    internal = 80
    external = 80
  }
}
