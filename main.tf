terraform {
   backend "remote" {
     # The name of your Terraform Cloud organization.
     organization = "example-organization"

     # The name of the Terraform Cloud workspace to store Terraform state files in.
     workspaces {
       name = "actions-demo"
     }
   }
 }
resource "null_resource" "example" {
    triggers = {
      value = "A example resource that does nothing!"
    }
}