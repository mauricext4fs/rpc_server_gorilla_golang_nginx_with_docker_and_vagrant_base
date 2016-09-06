# rpc\_server\_gorilla\_golang\_nginx\_with\_docker\_and\_vagrant\_base
Base rep to start a new rpc server project in golang. In does have Vagrant config file (best to use on Mac or Windows) to contain the docker container.

## Setup with Vagrant (Recommend on Mac and Windows)

Add this hosts to your /etc/hosts:

```
192.168.69.211 golang_sample_backend.local 
192.168.69.211 golang_sample.local 
```

## Setup with docker without Vagrant (Recommended on Linux)

Add this hosts to your /etc/hosts:

```
172.17.0.1 golang_sample_backend.local 
172.17.0.1 golang_sample.local 
```

## Usage

### Usage with Vagrant



### Usage with docker without Vagrant

#### Start everything together

Open a terminal and cd to this directory. Then do

```
docker-compose up
```
Then open your prefered Browser and type: http://golang_sample.local:9444/

From there you should see a pretty ugly formular with the title: Register to the System

