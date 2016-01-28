output "Atomic" {
  value = "hosts: ${element(openstack_compute_instance_v2.atomic.*.access_ip_v4, 0)}"
}
