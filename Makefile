CURL = curl

all:

deps:

test:

test-ci:
	docker run -it quay.io/wakaba/webkit-proxy usbmuxd --help
	docker run -it quay.io/wakaba/webkit-proxy ios_webkit_debug_proxy --help
	docker run -it quay.io/wakaba/webkit-proxy remotedebug_ios_webkit_adapter --help

updatenightly:
	$(CURL) -sSLf https://raw.githubusercontent.com/wakaba/ciconfig/master/ciconfig | RUN_GIT=1 REMOVE_UNUSED=1 perl

## License: Public Domain.
