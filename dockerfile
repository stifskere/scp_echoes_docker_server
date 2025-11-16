FROM steamcmd/steamcmd:debian-bookworm AS installer

# Download dependencies
RUN dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get install -y \
		lib32gcc-s1 \
		lib32stdc++6 \
		libstdc++6 \
		libicu72 \
	&& rm -rf /var/lib/apt/lists/*

# Add the echoes user.
RUN useradd -m -d /home/echoes echoes

# Setup the home directory
RUN mkdir /home/echoes/.local/share/Steam -p \
	&& chown -R echoes:echoes /home/echoes \
	&& chmod -R u+rwx /home/echoes

# CHange user and CWD.
USER echoes
WORKDIR /home/echoes
ENV HOME=/home/echoes

# Copy the entrypoint to the image.
COPY --chown=echoes:echoes ./load_variables.sh ./load_variables.sh
COPY --chown=echoes:echoes ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh && chmod +x ./load_variables.sh

# Setup healthcheck for game server.
RUN mkdir -p /home/echoes/.local/share/SCP-Echoes/logs
RUN touch /home/echoes/.local/share/SCP-Echoes/logs/container.log
HEALTHCHECK --interval=10s --timeout=3s --start-period=20s --retries=20 \
  CMD grep -q "Map Loaded, waiting for players" \
  /home/echoes/.local/share/SCP-Echoes/logs/container.log || exit 1

# Expose and start the server/game
EXPOSE 27015/udp
ENTRYPOINT [ "./entrypoint.sh" ]
