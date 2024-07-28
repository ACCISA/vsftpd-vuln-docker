# Use the official Ubuntu base image
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
	iputils-ping \
	nmap \
	wget \
	git \
	build-essential \
	iproute2 \
	tcpdump \
	netcat \
	locate \
	net-tools \
	ufw \
	vim

# Clone your Git repository
COPY vsftpd-infected /opt/infected
RUN mkdir /usr/share/empty
RUN cd /opt/infected && cp vsftpd /usr/local/sbin/vsftpd && \
	cp vsftpd.8 /usr/local/man/man8 && \
	cp vsftpd.conf.5 /usr/local/man/man5 && \
	cp vsftpd.conf /etc
RUN mkdir /var/ftp/ && useradd -d /var/ftp ftp
RUN chown root:root /var/ftp && \
	chmod og-w /var/ftp
CMD ["/opt/infected/vsftpd"]
CMD ["bash"]

