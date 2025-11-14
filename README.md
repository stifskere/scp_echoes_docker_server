# SCP:Echoes Dedicated Server Docker Image

This repository contains the necessary to build a docker image to host an SCP:Echoes
dedicated server, from a docker-compose for you to run to built images you can simply
pull and run in a kubernetes deployment, docker swarm cluster or even directly.

The provided image is ephemeral, meaning that it doesn't really cache anything
in early stages of the game, where there is nothing or very volatile stuff
to cache. Configurations are also applied once and everything is wiped when
the server is stopped.

> [!IMPORTANT]
> This repository and images are 100% maintained by me [stifskere](https://github.com/stifskere) [<esteve@memw.es>](mailto:esteve@memw.es),
> please, don't contact the game developers for support with this, you can find me
> in the [official Discord server](https://discord.gg/2YZnyPktZn) as Memw, feel free to ping me or open any issue
> regarding this repository.

## Running This Image

This image is hosted as `hub.docker.com/memw/echoes-unofficial:latest` or
alternatively in `ghcr.io/stifskere/scp_echoes_docker_server:latest`
for you to pull with your docker client.

This image downloads the game from steam and runs the provided dedicated server
within.

Since this game is relatively small it doesn't really support making a volume to
cache the game download, you can still attempt but it's most probable you get
permission errors or something along these lines.

> [!WARNING]
> This game is in alpha stage, while the image supports unauthenticated download
> you must own the game, so you will probably encounter an error while attempting
> to download this game anonymously.
>
> If you own the game in your account you can provide the `STEAM_USER`
> and `STEAM_PASS` environment variables and do an authenticated download.

## Configuration

The server has configuration options you can use to modify server behavior
such as display name, minimum and maximum amount of players, to see
the available configuration check out [their official wiki](https://wiki.scpechoes.com/configs/server).

You need to set the fields in the container environment variables,
and they will be written to the server configuration file.

All the configuration keys are translated to SCREAMING_SNAKE_CASE so for
example, the `ServerName` field would be `SERVER_NAME`, or `MaxPlayers`
would be `MAX_PLAYERS`.

## License

This is licensed under the [Apache-2.0](./LICENSE-APACHE) license or [MIT](./LICENSE-MIT) license at your option.
