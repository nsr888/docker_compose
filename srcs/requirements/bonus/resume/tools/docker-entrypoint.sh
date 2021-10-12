#!/bin/sh
cd /app && \
hugo server --bind ${BIND_IP}         \
            --appendPort=true        \
            --baseURL ${HUGO_BASEURL} \
            --config /app/config.toml
