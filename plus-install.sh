#make sure to put the license files into the folder that this scipt is run from.
#scipt needs to be run with sudo sh plus-install.sh

mkdir -p /etc/ssl/nginx
cp nginx-repo.key  /etc/ssl/nginx
cp nginx-repo.crt  /etc/ssl/nginx

wget http://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key
apt-get install apt-transport-https lsb-release ca-certificates
printf "deb https://plus-pkgs.nginx.com/ubuntu `lsb_release -cs` nginx-plus\n" | tee /etc/apt/sources.list.d/nginx-plus.list
wget -P /etc/apt/apt.conf.d https://cs.nginx.com/static/files/90nginx
apt update
apt install nginx-plus

cd /etc/nginx/conf.d/ 
wget https://gist.githubusercontent.com/nginx-gists/a51341a11ff1cf4e94ac359b67f1c4ae/raw/bf9b68cca20c87f303004913a6a9e9032f24d143/nginx-plus-api.conf

systemctl enable nginx
systemctl start nginx
nginx -v


