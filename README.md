# rpi-nginx-webdav

```bash
docker build --build-arg USER_ID=$(id -u mupimenov) --build-arg GROUP_ID=$(id -g mupimenov) -t rpi-nginx-webdav .
```

```bash
docker run --rm --name webdav -p 8080:80 -v /mnt/raid/mupimenov/:/data/ -e USERNAME=webdav -e PASSWORD=webdav rpi-nginx-webdav
```
