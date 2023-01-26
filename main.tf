terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2.3.0"
    }
  }
}

resource "local_file" "metadata" {
  content  = jsonencode(var.vars)
  filename = "${path.root}/${var.metadata_path}"
}
