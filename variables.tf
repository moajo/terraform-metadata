variable "vars" {
  description = "variables to export"
  type        = map(string)
}

variable "metadata_path" {
  description = "path to meta.json. Relative from path.root"
  type        = string
  default     = "./meta.json"
}
