FROM quay.io/wakaba/base:sid

RUN apt-get update && \
    apt-get install -y build-essential pkg-config checkinstall git \
                       autoconf automake libtool-bin \
                       libusbmuxd-dev libssl-dev usbmuxd \
                       python3-dev npm && \
    git clone https://github.com/google/ios-webkit-debug-proxy /tmp/ios-webkit-debug-proxy && \
    git clone https://github.com/libimobiledevice/libimobiledevice /tmp/libimobiledevice && \
    cd /tmp/libimobiledevice && git checkout 963083be85688206fe52042e8e32602d8139726e && \
    git clone https://github.com/libimobiledevice/libimobiledevice-glue /tmp/libimobiledevice-glue && \
    cd /tmp/libimobiledevice-glue && git checkout 6fcb8794592c8b275e615a6bc863c8c10e978174 && \
    git clone https://github.com/libimobiledevice/libplist /tmp/libplist && \
    cd /tmp/libplist && git checkout tags/2.2.0 && \
    cd /tmp/libplist && ./autogen.sh && make && make install && \
    cd /tmp/libimobiledevice-glue && ./autogen.sh && make && make install && \
    cd /tmp/libimobiledevice && ./autogen.sh && make && make install && \
    cd /tmp/ios-webkit-debug-proxy && ./autogen.sh && make && make install && \
    npm install remotedebug-ios-webkit-adapter -g && \
    rm -rf /var/lib/apt/lists/*

#   $ usbmuxd &
#   $ ios_webkit_debug_proxy
# or
#   $ remotedebug_ios_webkit_adapter --port=9222

## License: Public Domain.