Docker container for running [Folding@Home](http://foldingathome.org/)

### Usage
```bash
docker run --rm -it -p7396:7396 -p36330:36330 -e USERNAME=Anonymous -e EXTRA="--gpu=false" mikaelld/fahclient:latest
```

The web console is available on port `7396`.

### Arguments
All arguments are supplied through environment. Keys and usage is detailes below:

| Key           | Default value | Example       | Used for           | 
| ------------- | ------------- | ------------- | ------------------ |
| USERNAME      | Anonymous     | *fluffboll*   | --user |
| PASSKEY       | *not set*     | *12caa7...*   | --passkey |
| TEAM          | 238593        | *0*           | --team |
| POWER         | full          | *medium*      | --power |
| NVIDIA        | *not set*     | *440.64.00*   | NVIDIA driver version |
| EXTRA         | *not set*     | *--gpu=false* | *Additional arguments* |

### Disclaimer
I'm new to FAH and haven't had a chance to try out the Nvidia stuff myself. If it doesn't work out of the 
box and you figure out how to do it, please fork and create a pull request on 
https://github.com/mld/fahclient-docker/pulls.

