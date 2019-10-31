# To Compile NGINX+ images
**Step 1**
cd to nginx-plus-ctrl-agent

**Step 2**
Replace your own nginx-repo.crt and nginx-repo.key

**Step 3**
Identify the following parameter before hand

- CTRL\_HOST --> NGINX Controller FQDN
- API\_KEY --> NGINX Controller API\_KEY
- Identify your private repository.



**Example**

**To Build**

docker build --no-cache --build-arg API\_KEY=540286ae9ad5752ae7d7ca2d8ac527f8 --build-arg CTRL\_HOST=nginx-ctrl.foobz.com.au  -t reg.foobz.com.au/foobz/nginx-plus-ctrl-agent:slim .

**Push to private repository**

docker push reg.foobz.com.au/foobz/nginx-plus-ctrl-agent:slim

Youtube Video
https://www.youtube.com/watch?v=shEsY-kDuQA
