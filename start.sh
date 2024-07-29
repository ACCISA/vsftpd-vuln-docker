docker build -t ftp-container .
docker run -it --rm --net vuln-network --ip 10.0.0.3 --name my-ftp ftp-container
