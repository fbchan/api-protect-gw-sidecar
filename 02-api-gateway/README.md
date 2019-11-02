# Deploy API Gateway in MicroServices

### Deploy fluentd configmap
ubuntu:~$ kubectl apply -f sc-fluentd-apigw-td-configmap.yml
##### Note
Ensure you change your ELK server host and port reference in the configmap.

### Deploy nginxp microgw
ubuntu:~$ kubectl apply -f nginxp-microgw-a-slim.yml
##### Note
Ensure you  point your nginx+ and fluentd container section to your containers

### NGINX+ API GW
https://www.youtube.com/watch?v=nC8_NlifLEg

### Push API Management Policy from NGINX Controller
<img src=https://github.com/fbchan/api-protect-gw-sidecar/blob/master/02-api-gateway/api-microgw/api-m-00.png alt="API-M 00" width=1000>


<img src=https://github.com/fbchan/api-protect-gw-sidecar/blob/master/02-api-gateway/api-microgw/api-m-01.png alt="API-M 01" width=1000>

<img src=https://github.com/fbchan/api-protect-gw-sidecar/blob/master/02-api-gateway/api-microgw/api-m-02.png alt="API-M 02" width=1000>

<img src=https://github.com/fbchan/api-protect-gw-sidecar/blob/master/02-api-gateway/api-microgw/api-m-03.png alt="API-M 03" width=1000>


<img src=https://github.com/fbchan/api-protect-gw-sidecar/blob/master/02-api-gateway/api-microgw/api-m-04.png alt="API-M 04" width=1000>


Please contact your local F5/NGINX Sales representative to arrange for a DEMO or evaluation key.