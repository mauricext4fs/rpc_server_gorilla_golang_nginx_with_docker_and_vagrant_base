# rpc_server_gorilla_golang_nginx_with_docker_and_vagrant_base
Base rep to start a new rpc server project in golang. In does have Vagrant config file (best to use on Mac or Windows) to contain the docker container.

## Setup Vagrant

Add this hosts to your /etc/hosts:

192.168.69.211 golang_sample_backend.local
192.168.69.211 golang_sample.local

## Setup with docker without Vagrant

Add this hosts to your /etc/hosts:

172.17.0.1 golang_sample_backend.local
172.17.0.1 golang_sample.local
