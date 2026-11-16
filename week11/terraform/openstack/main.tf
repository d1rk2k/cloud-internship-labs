terraform {
  required_version = ">= 1.5.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 3.0"
    }
  }
}

provider "openstack" {
  cloud = "devstack-admin"
}

# Deploy two OpenStack virtual machines

resource "openstack_compute_instance_v2" "week11_instances" {
  count = var.instance_count

  name      = format("terraform-vm%02d", count.index + 1)
  image_id  = "3e763664-5f14-40d4-86fa-66d5ba66f7b0"
  flavor_id = "1"

  security_groups = [
    "default"
  ]

  network {
    uuid = "02fb4f1d-e11c-4d46-aa6d-73a538164ee6"
  }
}
