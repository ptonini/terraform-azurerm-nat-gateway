variable "name" {}

variable "rg" {
  type = object({
    name = string
    location = string
  })
}