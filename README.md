Back channeling
===============

https://github.com/kawasima/back-channeling の docker image です

使い方
------

```
docker run -d \
  -p {PORT}:3009 \
  -v {DIR}:/opt/datomic/data \
  negokaz/back-channeling
```

```
docker run -d \
  -p {PORT}:3009 \
  -e DATOMIC_URL=~~~~~ \
  negokaz/back-channeling
```
