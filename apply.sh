#!/bin/bash
FILES_DIR="`pwd`/`dirname $0`"
cd $HOME
for i in `find $FILES_DIR -mindepth 1 -maxdepth 1 -type f ! -name apply.sh ! -name README.md`; do 
	LINK=".`basename $i`"
	if [[ -h "$LINK" ]] || [[ -f "$LINK" ]]  ; then
		echo "$LINK already exists, skipping..."
	else
		echo "Linking $LINK to $i..."
		ln -s "$i" "$LINK"
	fi
done
