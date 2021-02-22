安装 V2Ray

```
curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
bash install-release.sh
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
systemctl enable v2ray
systemctl is-enabled v2ray.service

systemctl restart v2ray
systemctl status v2ray

systemctl start|stop|status|reload|restart|force-reload v2ray
```

安装 aaPanel

```
yum install -y wget && wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh && bash install.sh
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
