#!/bin/bash

user=""
db=""
password=""

mongo <<EOF
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


mongo <<EOF
   use ${db};
   admin = db.getSiblingDB("${db}");
   admin.createUser(
    {
	    user: "${user}",
        pwd: "${password}",
        roles: [ { role: "readWrite", db: "${db}" } ]
    });
EOF