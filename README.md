# rancher-glusterfs-server
Gluster FS Cluster for being used with Rancher Server

## Create a stack gluster

### Add un service gluster01
* Enter the following information
  * Name: gluster01
  * Image: oroc95/rancher-glusterfs-server:latest
* Expand Advanced Options and follow these steps:
  * Command section:
    * ENV  DEBUG=1
  * Volumes section: - add these volumes
    *  gluster01-data:/gluster_volume
    * gluster01-config:/var/lib/glusterd
  * Networking section
    * Choose Managed Network on Docker0
    * fix the IP under ipsec rancher : 10.42.33.9
    * enable reuse the IP, when upgrading or replace instance
  * Security/Host section
    * Enable Give the container full access to the host checkbox
### Add un service gluster02
* Enter the following information
  * Name: gluster02
  * Image: oroc95/rancher-glusterfs-server:latest
* Expand Advanced Options and follow these steps:
  * Command section:
    * ENV  DEBUG=1
    * ENV GLUSTER_PEER=gluster01
  * Volumes section: - add these volumes
    *  gluster02-data:/gluster_volume
    * gluster02-config:/var/lib/glusterd
  * Networking section
    * Choose Managed Network on Docker0
    * fix the IP under ipsec rancher : 10.42.182.55
    *  enable reuse the IP, when upgrading or replace instance
  * Security/Host section
    * Enable Give the container full access to the host checkbox
