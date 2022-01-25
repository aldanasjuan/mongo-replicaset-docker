#!/bin/bash

user=$USER
db=$DB
password=$PASSWORD

echo $PASSWORD

mongosh <<EOF
var config = {
    "_id": "rs0",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongo:27017",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF

sleep 2


mongosh <<EOF
   db = db.getSiblingDB("${db}");
   db.createUser(
    {
	    user: "${user}",
        pwd: "${password}",
        roles: [ { role: "readWrite", db: "${db}" } ]
    });
EOF

mongosh <<EOF
    db.adminCommand( { setFeatureCompatibilityVersion: "5.0" } )
EOF