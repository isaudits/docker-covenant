#!/bin/bash

#docker run -it -p 7443:7443 -p 80:80 -p 443:443 --name covenant -v </absolute/path/to/Covenant/Covenant/Data>:/app/Data covenant
docker run -it --rm -p 7443:7443 -p 80:80 -p 443:443 --name covenant covenant