resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      name = "frontend"
    }
  }

  spec {
    replicas = 4
    selector {
      match_labels = {
        name = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          name = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}


########
# service  #
########

resource "kubernetes_service" "nginx-service" {
  metadata {
    name = "nginx-service"
    labels = {
      name = "nginx"
    }
  }

  spec {
    type = "NodePort"
    selector = {
      name = "nginx"
    }
    port {
      port = 80
      target_port = 80
      node_port   = 30080
      protocol    = "TCP"
    }    
  }
}

 
