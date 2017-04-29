FROM debian:jessie

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends ca-certificates apt-transport-https wget \
	&& echo "deb https://packages.mapcrafter.org/debian jessie main" > /etc/apt/sources.list.d/mapcrafter.list \
	&& wget -O /etc/apt/trusted.gpg.d/mapcrafter.gpg http://packages.mapcrafter.org/debian/keyring.gpg \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends python mapcrafter \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get purge -y --auto-remove ca-certificates apt-transport-https wget

ENTRYPOINT ["mapcrafter"]
