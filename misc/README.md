SystemD unit service script
---------------------------

```shell
sudo cp systemd.defaults /etc/default/prometheus-sunpower-pvs-exporter
sudo cp systemd.service /lib/systemd/system/prometheus-sunpower-pvs-exporter.service
sudo systemctl enable prometheus-sunpower-pvs-exporter.service
sudo systemctl start prometheus-sunpower-pvs-exporter
```
