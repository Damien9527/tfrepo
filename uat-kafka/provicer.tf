terraform {
  required_providers {
    tencentcloud = {
      source = "tencentcloudstack/tencentcloud"
      version = "1.53.8"
    }

    ansible = {
      source = "nbering/ansible"
      version = "1.0.4"
    }

  }
}




provider "tencentcloud" {
    secret_id  = "AKIDVXN9mttZDKtHTUnub7RccR4exAB0iIBs"
    secret_key = "maCc2d5LkU7NZe3Sflx0wFet0DICaweQ"
    region     = "ap-guangzhou"
}
