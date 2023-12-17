# Example content in main.tf
provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "example-deployment"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "example"
      }
    }

    template {
      metadata {
        labels = {
          app = "example"
        }
      }

      spec {
        container {
          image = "your-docker-registry/your-image-name:v1.0.0"
          name  = "example-container"
        }
      }
    }
  }
}
