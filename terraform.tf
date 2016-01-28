provider "openstack" {
  user_name  = "${var.user_name}"
  tenant_name = "${var.tenant_name}"
  password  = "${var.password}"
  auth_url  = "${var.auth_url}"
}

resource "openstack_compute_secgroup_v2" "default-atomic" {
  name = "atomic-sg"
  description = "An Atomic Default Security Group"

  # SSH from outside
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}

# Create an Atomic instance
resource "openstack_compute_instance_v2" "atomic" {
  name = "atomic-${count.index+1}"
  image_name = "${var.image_name}"
  flavor_name = "${var.flavor_name}"
  key_pair = "${var.key_pair}"
  security_groups = ["atomic-sg"]
  count = "${var.cluster_size}"
}
