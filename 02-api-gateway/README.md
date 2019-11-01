# Deploy API Gateway in MicroServices

### Deploy fluentd configmap
ubuntu:~$ kubectl apply -f sc-fluentd-apigw-td-configmap.yml
##### Note
Ensure you change your ELK server host and port reference in the configmap.

### Deploy nginxp microgw
ubuntu:~$ kubectl apply -f nginxp-microgw-a-slim.yml
##### Note
Ensure you  point your nginx+ and fluentd container section to your containers

### Push API Management Policy from NGINX Controller
<img src=https://github.com/fbchan/api-protect-gw-sidecar/blob/master/03-sidecar/nginxp-sidecar/sidecar-layout.png alt="Sidecar Layout" width=800>

