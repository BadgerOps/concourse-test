job "concourse-test" {
  datacenters = ["dc1"]
  type = "service"

  update {
    stagger = "10s"
    max_parallel = 1
  }

  group "script" {
    count = 1
    ephemeral_disk {
      size = 20
    }
    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }

    task "hello" {
      driver = "docker"
      config {
        image = "thecase/concourse-test:latest"
      }

      resources {
        cpu    = 20 # MHz 
        memory = 20 # MB 
        network { mbits = 10 }
      }

      logs {
        max_files     = 3
        max_file_size = 2
      }
    }
  }
}
