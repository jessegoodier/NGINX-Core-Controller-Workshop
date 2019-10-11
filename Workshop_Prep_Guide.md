# Workshop Guide

We will need 2 VMs. 

---

## VM1: workshop-plus1

  1. Install docker and docker-compose on this VM only. Note the convenience script at the bottom of the page:
  <https://docs.docker.com/install/linux/docker-ce/ubuntu/>

  2. Install docker-compose:
  <https://docs.docker.com/compose/install/>
  3. Clone this reop:

>git clone git@github.com:jessegoodier/NGINX-Core-Controller-Workshop.git

>cd NGINX-Core-Controller-Workshop

>sh start.sh

4. Wait 30 seconds or so for the ergastdb to init. Run these tests:

  >curl localhost:81

  >curl localhost:8001/api/f1

### During the workshop, we will follow this guide to install NGINX Plus:

<https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-plus/>

---

## VM2: workshop-controller

1. Update /etc/hosts file on both VMs with the ip of the controller.

### We will complete the controller install during the workshop following this guide:

<https://docs.nginx.com/nginx-controller/admin-guide/installing-nginx-controller/>
