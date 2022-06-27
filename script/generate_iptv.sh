
#!/bin/bash

set -e
set -o pipefail
set -x

mkdir -p ./iptv
curl --silent --fail https://raw.githubusercontent.com/qwerttvv/Beijing-IPTV/master/IPTV-Unicom-Multicast.m3u \
| gawk '{
    if ($0 ~ /^rtp:\/\//) {
        sub(/\:\/\//, "/");
        print "http://192.168.10.1:8686/"$0;
    } else {
        print $0;
    }
}' > ./iptv/iptv.m3u

ls -l ./iptv/