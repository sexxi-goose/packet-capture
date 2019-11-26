transfer() {
    # check arguments
    if [ $# -eq 0 ];
    then
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi

    # get temporarily filename, output is written to this file show progress can be showed
    tmpfile=$( mktemp -t transferXXX )

    # upload stdin or file
    file=$1

    if tty -s;
    then
        basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

        if [ ! -e $file ];
        then
            echo "File $file doesn't exists."
            return 1
        fi

        if [ -d $file ];
        then
            # zip directory and transfer
            zipfile=$( mktemp -t transferXXX.zip )
            cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
            curl https://bashupload.com/$basefile.zip --data-binary @$basefile.zip >> $tmpfile
            rm -f $zipfile
        else
            # transfer file
            curl https://bashupload.com/$file --data-binary @$file >> $tmpfile
        fi
    else
        echo "Attempt to trasnfer pipe, not supported"
    fi

    # cat output link
    cat $tmpfile

    # cleanup
    rm -f $tmpfile
}
