FROM python:3.12-slim

LABEL author="Manish Yadav" maintainer="manish@arixbyte.com"

# Install system dependencies
RUN apt-get update -y \
    && apt-get install -y git curl ffmpeg gcc g++ make iproute2 \
    && rm -rf /var/lib/apt/lists/*

# Set up the Pterodactyl 'container' user
RUN useradd -d /home/container -m container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Copy the entrypoint script
COPY --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
