初始化系统环境

```
yum update -y
yum install epel-release -y
yum update -y
yum install bind-utils net-tools netstat wget ntp policycoreutils-python chrony git dnf -y
yum groups install "Development Tools" -y
```

时间同步

```
systemctl enable chronyd
systemctl start chronyd
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp yes
timedatectl

date -R
```
基础测速

```
wget -O speedtest-cli https://raw.githubusercontent.com/wn789/speedtest-cli/master/speedtest.py
chmod +x speedtest-cli
./speedtest-cli

./speedtest-cli --server 7190
./speedtest-cli --server 5905
./speedtest-cli --server 20976
./speedtest-cli --server 4884
./speedtest-cli --server 16145
./speedtest-cli --server 25728
./speedtest-cli --server 25858
./speedtest-cli --server 6715
./speedtest-cli --server 16332
```
安装锐速

```
systemctl reboot

rpm -ivh http://vault.centos.org/7.2.1511/updates/x86_64/Packages/kernel-3.10.0-327.36.3.el7.x86_64.rpm  --force

grub2-set-default "CentOS Linux (3.10.0-327.36.3.el7.x86_64) 7 (Core)"

systemctl reboot

rpm -qa kernel

yum remove

cat /proc/version

wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder-v.sh && bash serverspeeder-v.sh CentOS 7.2 3.10.0-327.el7.x86_64 x64 3.11.20.5 serverspeeder_72327

```
系统连接数优化

```
sed -i "s/#DefaultLimitNOFILE=/DefaultLimitNOFILE=infinity/g" /etc/systemd/system.conf
```
防火墙设置及SSH端口修改

```
firewall-cmd --zone=public --add-port=26871/tcp --permanent

systemctl enable firewalld
systemctl is-enabled firewalld.service
service firewalld restart
firewall-cmd --get-active-zones
firewall-cmd --set-default-zone=public
firewall-cmd --zone=public --list-all

sed -i "s/#Port 22/Port 26871/g" /etc/ssh/sshd_config
semanage port -a -t ssh_port_t -p tcp 26871
````
最后的修改

```
systemctl reboot

ulimit -a

yum --exclude=kernel* update
``

安装 V2Ray


```
bash <(curl -L -s https://install.direct/go.sh)
```
相关文件

```
/usr/bin/v2ray/v2ray
/usr/bin/v2ray/v2ctl
/etc/v2ray/config.json
/usr/bin/v2ray/geoip.dat
/usr/bin/v2ray/geosite.dat
```

检查配置文件

```
/usr/bin/v2ray/v2ray -test -config /etc/v2ray/config.json
```

相关命令

```
service v2ray start

service v2ray start|stop|status|reload|restart|force-reload


systemctl start v2ray
systemctl restart v2ray
systemctl status v2ray


systemctl start|stop|status|reload|restart|force-reload v2ray
```

设置开机启动
```
systemctl start v2ray

systemctl enable v2ray

systemctl status v2ray

systemctl is-enabled v2ray.service

systemctl start|stop|status|reload|restart|force-reload v2ray
```

Nginx 转发
```

    location /cache
    {
      if ($http_upgrade != "websocket") {
          return 404;
      }
      proxy_redirect off;
      proxy_pass http://127.0.0.1:54321;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "upgrade";
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
    
```
