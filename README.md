# vsftpd-vuln-docker
Container vulnerable vstfpd v2.3.4 service

Prequesites:
docker
nmap

To run Docker:
docker network create --subnet=10.0.0.0/8 vuln-network
docker build -t ftp-container .
docker run -it --rm --net vuln-network --ip 10.0.0.2 ftp-container

To run VSFTP Deamon:
/opt/infected/vstfpd
---
netstat -plantu should show LISTEN on 21 port
on the attack station nmap 10.0.0.2 should show ftp on port 21
