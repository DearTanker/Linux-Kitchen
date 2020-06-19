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

Python3 安装

```
dnf install python3

python3 --version

alternatives --set python /usr/bin/python3

alternatives --auto python

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

BBR 原版
```
uname -r

rpm -qa | grep kernel

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


```
