db = db.getSiblingDB(process.env.MONGO_DB);
db.createUser({user: process.env.MONGO_USER,pwd: process.env.MONGO_PASSWORD,roles: [ { role: "readWrite", db: process.env.MONGO_DB } ]});
db.adminCommand( { setFeatureCompatibilityVersion: "5.0" } )
