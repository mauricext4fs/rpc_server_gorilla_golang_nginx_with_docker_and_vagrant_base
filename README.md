# rpc\_server\_gorilla\_golang\_nginx\_with\_docker\_and\_vagrant\_base
Base rep to start a new rpc server project in golang. In does have Vagrant config file (best to use on Mac or Windows) to contain the docker container.

For more information about this project and a line by line explanation please refer to: [https://mauricext4fs.wordpress.com/2016/09/25/complete-golang-rpc-application/]

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

First follow the step to bring the whole system up that fit your choice (Bringing all up with docker without Vagrant) or (Bringing all up with docker and Vagrant)

Open your prefered Browser and type: http://golang_sample.local:9444/

From there you should see a pretty ugly formular with the title: Register to the System.

If you press enter or the "Register" button this will trigger an Ajax-Post request to Nginx which serve as a Proxy to the golang RPC server.

### Bringing all up with docker without Vagrant


Open a terminal and cd to this directory. Then do

```
docker-compose up
```

The first time this may take some time. Docker will download all intermediary container. When everything is completed you should see something like this:

```
Starting rpcservergorillagolangnginxwithdockerandvagrantbase_postgres_db_1
Starting rpcservergorillagolangnginxwithdockerandvagrantbase_golang_1
Starting rpcservergorillagolangnginxwithdockerandvagrantbase_nginx_1
Attaching to rpcservergorillagolangnginxwithdockerandvagrantbase_postgres_db_1, rpcservergorillagolangnginxwithdockerandvagrantbase_golang_1, rpcservergorillagolangnginxwithdockerandvagrantbase_nginx_1
postgres_db_1  | LOG:  database system was shut down at 2016-09-06 09:01:20 UTC
postgres_db_1  | LOG:  MultiXact member wraparound protections are now enabled
postgres_db_1  | LOG:  autovacuum launcher started
postgres_db_1  | LOG:  database system is ready to accept connections
nginx_1        | 2016/09/06 09:01:31 [notice] 1#1: using the "epoll" event method
nginx_1        | 2016/09/06 09:01:31 [notice] 1#1: nginx/1.10.0
nginx_1        | 2016/09/06 09:01:31 [notice] 1#1: built by gcc 4.9.2 (Debian 4.9.2-10) 
nginx_1        | 2016/09/06 09:01:31 [notice] 1#1: OS: Linux 4.2.0-42-generic
nginx_1        | 2016/09/06 09:01:31 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 65536:65536
nginx_1        | 2016/09/06 09:01:31 [notice] 1#1: start worker processes
nginx_1        | 2016/09/06 09:01:31 [notice] 1#1: start worker process 8
```

### Bringing all up with docker and Vagrant

Open a terminal and cd to this directory. Then do

```
vagrant up
```

This may take a while, as vagrant will download the VM from the web.

The previous Command should leave you the command prompt and look similar to this:

```
==> default: Configuring and enabling network interfaces...
==> default: Mounting shared folders...
    default: /vagrant => /Users/mauricecourtois/src/rpc_server_gorilla_golang_nginx_with_docker_and_vagrant_base
==> default: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> default: flag to force provisioning. Provisioners marked to run always will still run.
h:rpc_server_gorilla_golang_nginx_with_docker_and_vagrant_base mauricecourtois$
```

Then do:

```
vagrant ssh
```

wait a bit...

when prompt again type:

```
cd /vagrant
```

Then follow the same instruction as in "Bringing all up with docker without Vagrant"

## Extension

To add more services to the RPC server you just need to add (or copy golang/src/golang_sample/service/register.go) in golang/src/golang_sample/service/. Then you only need to add a line in main.go to register the new service as RPC service.

## Database

To access the PostgreSQL database included in this sample:

( if using Vagrant )
host: 192.168.69.211
( if using Docker only )
host: 172.17.0.1
username: postgres
password: (NO PASSWORD)

