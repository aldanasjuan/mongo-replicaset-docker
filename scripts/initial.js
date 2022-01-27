db = db.getSiblingDB(_getEnv("DB"));
db.createUser(
 {
     user: _getEnv("USER"),
     pwd: _getEnv("PASSWORD"),
     roles: [ { role: "readWrite", db: _getEnv("DB") } ]
 });

 db.adminCommand( { setFeatureCompatibilityVersion: "5.0" } )