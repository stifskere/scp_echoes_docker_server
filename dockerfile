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


RUN useradd -m -d /home/echoes echoes

RUN mkdir /home/echoes/.local/share/Steam -p \
	&& chown -R echoes:echoes /home/echoes \
	&& chmod -R u+rwx /home/echoes

USER echoes
WORKDIR /home/echoes
ENV HOME=/home/echoes

# Copy the entrypoint to the image.
COPY --chown=echoes:echoes ./load_variables.sh ./load_variables.sh
COPY --chown=echoes:echoes ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh && chmod +x ./load_variables.sh

# Expose and start the server/game
EXPOSE 27015
ENTRYPOINT [ "./entrypoint.sh" ]
