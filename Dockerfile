FROM php:latest as builder

# Install build dependencies
RUN set -eux \
	&& DEBIAN_FRONTEND=noninteractive apt-get update -qq \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends --no-install-suggests \
		ca-certificates \
		curl \
		git \
	&& git clone https://github.com/squizlabs/PHP_CodeSniffer

RUN set -eux \
	&& cd PHP_CodeSniffer \
  && VERSION="$( git describe --abbrev=0 --tags )" \
	&& curl -sS -L https://github.com/squizlabs/PHP_CodeSniffer/releases/download/${VERSION}/phpcs.phar -o /phpcs.phar \
	&& chmod +x /phpcs.phar \
	&& mv /phpcs.phar /usr/bin/phpcs

FROM php:latest as production

COPY --from=builder /usr/bin/phpcs /usr/bin/phpcs

COPY entrypoint.sh \
     problem-matcher.json \
     /action/

RUN chmod +x /action/entrypoint.sh

ENTRYPOINT ["/action/entrypoint.sh"]
