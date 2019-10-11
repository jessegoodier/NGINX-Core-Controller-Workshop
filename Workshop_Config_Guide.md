# Workshop Config Guide

## Install Controler Agent on workshop-plus1

1. Uncomment the following lines from /etc/nginx/conf.d/default.conf

```conf
    location /api/ {
        api write=on;
    #    allow 127.0.0.1;
    #    deny all;
    }

    # enable NGINX Plus Dashboard; requires /api/ location to be
    # enabled and appropriate access control for remote access
    #
    location = /dashboard.html {
        root /usr/share/nginx/html;
    }
```

2. Reload nginx
    >nginx -s reload

3. Copy commands from controller>Graphs>New Instance (on bottom left).

4. 