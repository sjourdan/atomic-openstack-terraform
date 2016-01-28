# Atomic Host on OpenStack with Terraform

The goal of this is to launch an [Atomic Host](http://www.projectatomic.io/)] on [OpenStack](http://www.openstack.org/) with [Terraform](https://www.terraform.io/).

It will create a security group named "atomic-sg", allowing SSH, and an instance. If you don't have an Atomic Host image on your OpenStack, we'll create one.

Configure your own environment inside the `terraform.tfvars` file:

    cp terraform.tfvars.sample terraform.tfvars

## Atomic Host

Read [more information about Atomic Host](http://www.projectatomic.io/download/).

Download a QCOW2 image for your favourite flavour. Here we'll chose CentOS.

* [CentOS Atomic Host](https://wiki.centos.org/SpecialInterestGroup/Atomic/Download/)
* [Fedora Atomic Host](https://getfedora.org/cloud/download/atomic.html)

Exemple:

      wget http://cloud.centos.org/centos/7/atomic/images/CentOS-Atomic-Host-7-GenericCloud.qcow2

### OpenStack Glance Atomic Host Image Availability

To make the Atomic Host image available on OpenStack with Glance:

    glance image-create --name "CentOS Atomic 20151118" \
      --container-format bare --disk-format qcow2 \
      --file CentOS-Atomic-Host-7-GenericCloud.qcow2

## Terraform and Atomic

    terraform apply
    [...]
    Outputs:
    Atomic = hosts: 1.2.3.4

The default username is _centos_ for this machine:

    ssh centos@1.2.3.4

## Atomic

Some base commands, or [read more](http://www.projectatomic.io/docs/).

    sudo atomic host status
    sudo atomic host upgrade
