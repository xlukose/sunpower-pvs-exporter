1. Grab Raspbian image
2. Use Balena Etcher to write that image to microSD
3. Boot, login (default: pi\raspberry)
4. sudo raspi-config
5. Change PW
6. Rename machine to something easy and unique 
7. Enable WiFI
8. Enable SSH
9. Update & Upgrade - sudo apt-get update && sudo apt-get upgrade
10. Install Docker - curl -sSL https://get.docker.com | sh
11. Add pi user to Docker group - sudo usermod -aG docker pi
12. Create network bridge - docker network create --driver=bridge solarbridge
13. Install Grafana docker container - docker pull grafana/grafana
14. Run Grafana - docker run -d --restart unless-stopped --name=grafana -p 3000:3000 --network solarbridge grafana/grafana
15. Login (default: admin\admin)
16. Install Prometheus docker container - docker pull prom/prometheus
17. Run Prometheus - docker run -d --restart unless-stopped --name=prometheus -p 9090:9090 --network solarbridge -v /home/pi/sunpower-pvs-exporter/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
18. Install PIP - apt-get install python-pip
19. Install git - apt-get install git
20. Clone repository - git clone https://github.com/xlukose/sunpower-pvs-exporter.git
21. Navigate to PVS Exporter directory - cd sunpower-pvs-exporter
22. Build exporter docker container - docker build -t sunpower .
23. Run Sunpower - docker run -d --restart unless-stopped --name=grafana -p 9110:9100 --network solarbridge sunpower
24. Set static IP on eth1 or wlan0:
nano /etc/dhcpcd.conf
interface eth1
static ip_address=172.27.153.135/24
static routers=172.27.153.1
static domain_name_servers=172.27.153.1

nano /etc/dhcpcd.conf
interface wlan0
static ip_address=172.27.152.14/24
static routers=172.27.152.1
static domain_name_servers=172.27.152.1
