# rancher-glusterfs-server
Gluster FS Cluster for being used with Rancher Server

## Create a stack gluster

### Add un service gluster01
* Enter the following information
 * Name: gluster01
 * Image: oroc95/rancher-glusterfs-server:latest
* Expand Advanced Options and follow these steps:
 * Volumes section:
  * Add this volume: gluster01-data:/gluster_volume
  * Add this volume: gluster01-config:/var/lib/glusterd
 * Networking section – Choose Managed Network on Docker0
 * Security/Host section – Enable Give the container full access to the host checkbox
