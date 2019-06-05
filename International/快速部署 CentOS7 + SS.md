```


yum install epel-release -y
yum update -y
yum install bind-utils net-tools wget ntp policycoreutils-python chrony git dnf -y

systemctl enable chronyd
systemctl start chronyd

timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp yes
timedatectl

wget -O speedtest-cli https://raw.githubusercontent.com/wn789/speedtest-cli/master/speedtest.py
chmod +x speedtest-cli
./speedtest-cli
./speedtest-cli --server 7190
./speedtest-cli --server 5905
./speedtest-cli --server 20976

systemctl reboot

rpm -ivh http://vault.centos.org/7.2.1511/updates/x86_64/Packages/kernel-3.10.0-327.36.3.el7.x86_64.rpm  --force

cat /boot/grub2/grub.cfg |grep menuentry

grub2-set-default "CentOS Linux (3.10.0-327.36.3.el7.x86_64) 7 (Core)"

systemctl reboot

grub2-editenv list

rpm -qa kernel

yum remove

cat /proc/version

wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder-v.sh && bash serverspeeder-v.sh CentOS 7.2 3.10.0-327.el7.x86_64 x64 3.11.20.5 serverspeeder_72327

wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks.sh
chmod +x shadowsocks.sh
./shadowsocks.sh 2>&1 | tee shadowsocks.log

wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev.sh
chmod +x shadowsocks-libev.sh
./shadowsocks-libev.sh 2>&1 | tee shadowsocks-libev.log

sed -i "s/#DefaultLimitNOFILE=/DefaultLimitNOFILE=infinity/g" /etc/systemd/system.conf

echo "net.ipv4.icmp_echo_ignore_all = 1" >> /etc/sysctl.conf
sysctl -p

wget --no-check-certificate -O /opt/shadowsocks-crond.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-crond.sh
chmod 755 /opt/shadowsocks-crond.sh
(crontab -l; echo "*/5 * * * * /opt/shadowsocks-crond.sh") | crontab -
(crontab -l; echo "* 4 * * * /serverspeeder/bin/serverSpeeder.sh restart") | crontab -
crontab -l
service crond restart

firewall-cmd --zone=public --add-port=26871/tcp --permanent
firewall-cmd --zone=public --add-port=6000-9999/tcp --permanent
firewall-cmd --zone=public --add-port=6000-9999/udp --permanent

systemctl enable firewalld
systemctl is-enabled firewalld.service
service firewalld restart
service firewalld reload
firewall-cmd --get-active-zones
firewall-cmd --set-default-zone=public
firewall-cmd --zone=public --list-all

sed -i "s/#Port 22/Port 26871/g" /etc/ssh/sshd_config
semanage port -a -t ssh_port_t -p tcp 26871

systemctl reboot

ulimit -a

/etc/init.d/shadowsocks restart
/etc/init.d/shadowsocks status

/serverspeeder/bin/serverSpeeder.sh restart
/serverspeeder/bin/serverSpeeder.sh status

tail -f /var/log/shadowsocks.log

```
