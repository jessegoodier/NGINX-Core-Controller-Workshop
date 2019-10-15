# Workshop Config Guide



## Install NGINX Plus on VM1

1. Install controller following the install guide: <https://docs.nginx.com/nginx-controller/admin-guide/installing-nginx-controller/>

## Install NGINX Plus on VM1

2. Either follow the NGINX Plus install guide <https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-plus/> (or optionally use the plus-isntall.sh cheat script)


3. Optional: either use the nginx-plus-api.conf config or uncomment the following lines from /etc/nginx/conf.d/default.conf. The fucntionality here can be enabled using the controller GUI as well.

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

3. Browse to the real-real time dashboard that was just enabled by going to http://plus-ip/dashboard.html 

## Install Controler Agent on workshop-plus1

4. Copy commands from the controller>Graphs>New Instance (on bottom left).

## Configure Load Balancing Within Controller

5. Wait for the new instance to appear, then click on the load balancing tab and edit the default route to be a proxy to http://time_service/

6. Save all sections you modified and then create a new upstream group called time_service

7. In the upstream servers section add IPofPlusInstance:81 and IPofPlusInstance:82 give them weights of 1 and 2 respectively.

8. Save all sections and note the additial options availible.

9.  Save the configuration and then click the Instances menu and push the config to your plus instance.

10. run a curl (or web browser) to the IP of your plus instance and refresh a few times to see the load balancing.

11. Feel free to change the balancing algorithim and re-push the config to see the different results.

12. View the changes made to /etc/nginx/nginx.conf 

## Configure API Management

13. Go back to the Load Balancing tab and click instances and unlink your plus instance.

14. Once complete, click on API Management and entry points. Name it F1_API with the IP of the Plus1 VM on port 80 and add the plus instance to it.

15. Next create an upstream group, name it F1 Upstreams and add IPofPlusInstance:8001 and IPofPlusInstance:8002

16. Now create an API definition and name it F1 API. Use the base path of /api/f1

17. Save and add resources /drivers and /seasons. on /seasons change from prefix to exact. Call this environment production.

18. Select the entry point, click save. 

19. Scroll to the bottom and add the routes to the resources we created.

20. Publish and wait for the success message.

21. curl a few of these examples:

```
curl localhost/api/f1/seasons
curl localhost/api/f1/drivers
curl localhost/api/f1/seasons/2003
curl localhost/api/f1/seasons/2003.json
```

22. Because json is better, let's force all responses to be json. Edit the config and add a rule>rewrite rule matching ^(.*)$ to $1.json

23. Plublish and test a couple more requests.