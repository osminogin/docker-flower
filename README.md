# docker-flower

[![](https://img.shields.io/docker/build/osminogin/docker-flower.svg)](https://hub.docker.com/r/osminogin/docker-flower/builds/) [![](https://img.shields.io/docker/stars/osminogin/docker-flower.svg)](https://hub.docker.com/r/osminogin/docker-flower) [![](https://images.microbadger.com/badges/image/osminogin/docker-flower.svg)](https://microbadger.com/images/osminogin/docker-flower) [![License: MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg)](https://opensource.org/licenses/MIT)

Star this container on Docker Hub :star2: https://hub.docker.com/r/osminogin/flower/


## Getting started


### Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/r/osminogin/flower/) and is the recommended method of installation.

```bash
docker pull osminogin/flower
```

Alternatively you can build the image yourself.

```bash
docker build -t tor github.com/osminogin/docker-flower
```


### Quickstart


```bash
docker run -p 127.0.0.1:5555:5555 --name flower --link redis:redishost osminogin/flower --broker redis://redishost
```

After start Flower available on `localhost:5555`

:exclamation:**Warning**:exclamation:

Don't bind Flower management interface port 5555 to public network addresses if you don't know exactly what you are doing (better bind to localhost as in the example above).


## Ports

* `5555`


## Unit file for systemd

#### tor.service

```ini
[Unit]
Description=Flower service
After=docker.service
Requires=docker.service

[Service]
Restart=on-failure
RestartSec=60s
ExecStartPre=/usr/bin/docker pull osminogin/flower
ExecStart=/usr/bin/docker run --rm --name flower -p 127.0.0.1:5555:5555 osminogin/flower --broker redis://redishost
ExecStop=/usr/bin/docker stop flower

[Install]
WantedBy=multi-user.target
```

## License

MIT
