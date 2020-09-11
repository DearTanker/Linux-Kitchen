初始化系统环境

```
yum update -y
yum install epel-release -y
yum update -y
yum install bind-utils net-tools wget ntp policycoreutils-python chrony git dnf -y
yum groups install "Development Tools" -y
yum install glibc-headers gcc-c++ -y

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

bash <(curl -Lso- https://git.io/superspeed)

curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s fast

```

BBR 原版
```
uname -r

rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

yum install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm -y

yum --enablerepo=elrepo-kernel install kernel-ml -y

rpm -qa | grep kernel

egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'

grub2-set-default 0

reboot

uname -r

开启BBR，修改sysctl的配置

echo 'net.core.default_qdisc=fq' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv4.tcp_congestion_control=bbr' | sudo tee -a /etc/sysctl.conf

sysctl -p

查看当前可用的拥塞控制算法

sysctl net.ipv4.tcp_available_congestion_control
sysctl -n net.ipv4.tcp_congestion_control

lsmod | grep bbr

```

系统连接数优化

```
sed -i "s/#DefaultLimitNOFILE=/DefaultLimitNOFILE=infinity/g" /etc/systemd/system.conf
```

最后的修改

```
systemctl reboot

ulimit -a

yum --exclude=kernel* update
```

安装 V2Ray


```
// 安装可执行文件和 .dat 数据文件

curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh

// 只更新 .dat 数据文件

curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh

// 安装和更新 V2Ray

# bash install-release.sh

//安装最新发行的 geoip.dat 和 geosite.dat

# bash install-dat-release.sh

```

相关文件

```
installed: /usr/local/bin/v2ray
installed: /usr/local/bin/v2ctl
installed: /usr/local/share/v2ray/geoip.dat
installed: /usr/local/share/v2ray/geosite.dat
installed: /usr/local/etc/v2ray/config.json
installed: /var/log/v2ray/
installed: /var/log/v2ray/access.log
installed: /var/log/v2ray/error.log
installed: /etc/systemd/system/v2ray.service
installed: /etc/systemd/system/v2ray@.service
```

检查配置文件

```
/usr/local/bin/v2ray -test -config /usr/local/etc/v2ray/config.json
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

    location /path
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
