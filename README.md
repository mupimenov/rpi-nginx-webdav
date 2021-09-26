# rpi-nginx-webdav

```bash
docker build -t rpi-nginx-webdav .
```

```bash
docker run --name webdav -p 8080:80 -v /mnt/raid/mupimenov/:/data/ -e USERNAME=webdav -e PASSWORD=webdav rpi-nginx-webdav
```
