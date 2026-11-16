output "instance_names" {
  description = "Names of the Terraform-managed OpenStack instances"

  value = openstack_compute_instance_v2.week11_instances[*].name
}

output "instance_ids" {
  description = "IDs of the Terraform-managed OpenStack instances"

  value = openstack_compute_instance_v2.week11_instances[*].id
}

output "instance_private_ips" {
  description = "Private IP addresses of the OpenStack instances"

  value = [
    for instance in openstack_compute_instance_v2.week11_instances :
    instance.network[0].fixed_ip_v4
  ]
}
