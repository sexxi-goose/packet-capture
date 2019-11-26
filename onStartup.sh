onStartup() {
    set -e
    cd /usr/share/sexxi-goose
    yes | rm -rf uploads
    mkdir uploads
    mv *.pcap* uploads
    cd uploads
    zip sexxi-goose.zip *
    echo "$(date): $(transfer sexxi-goose.zip)" >> /usr/share/sexxi-goose/uploads.txt
}

