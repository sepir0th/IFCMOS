#!/bin/bash

if [ -z $SRCROOT ]; then
    DEST_DIR=${0%/*}
    DBSRC_DIR=$DEST_DIR/query”
else
    DEST_DIR=$BUILT_PRODUCTS_DIR/$PRODUCT_NAME.app
    DBSRC_DIR=$SRCROOT/MobileOfficeSolution/database/query
fi

echo $DBSRC_DIR
echo $DEST_DIR
echo "test"

find "${DBSRC_DIR}" -name "*.sql" | while read file; do
    dbfile="${DEST_DIR}/$(echo ${file} | sed 's/^.*\/\(.*\)\.sql$/\1/')"
    rm -f "${dbfile}"
    sqlite3 "${dbfile}" < "${file}"
done

