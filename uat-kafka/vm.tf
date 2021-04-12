
data "tencentcloud_availability_zones" "default" {
}

# Get availability images
data "tencentcloud_images" "default" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "centos"
}

# Get availability instance types
data "tencentcloud_instance_types" "default" {
  cpu_core_count = 1
  memory_size    = 1
}

# Create a web server
resource "tencentcloud_instance" "web" {
  instance_name              = "web server"
  availability_zone          = data.tencentcloud_availability_zones.default.zones.0.name
  image_id                   = data.tencentcloud_images.default.images.0.image_id
  instance_type              = data.tencentcloud_instance_types.default.instance_types.0.instance_type
  system_disk_type           = "CLOUD_PREMIUM"
  system_disk_size           = 50
  allocate_public_ip         = true
  internet_max_bandwidth_out = 10
  key_name                   =  "skey-9m4q4kl5"
  security_groups            = [tencentcloud_security_group.default.id]
  count                      = 1
  hostname                   = "cvm-{R:01}.sftcwl.com"
  user_data                  = "IyEvYmluL2Jhc2ggCmVjaG8gYGRhdGVgID4gL3RtcC90YWc="

}

## Create security group
resource "tencentcloud_security_group" "default" {
  name        = "web accessibility"
  description = "make it accessible for both production and stage ports"
}


resource "tencentcloud_security_group_lite_rule" "lite-rule-egress" {
  security_group_id = tencentcloud_security_group.default.id
  ingress = [
      "ACCEPT#0.0.0.0/0#ALL#TCP",
  ]
  egress = [
    "ACCEPT#0.0.0.0/0#ALL#TCP",
  ]
}
