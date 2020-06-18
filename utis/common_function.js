
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const config = require('config');



function makeJWT(obj, expiresIn = Math.floor(Date.now() / 1000) + (30 * 86400)) {

	return jwt.sign(obj, config.get('jwt_key'));

}
async function verifyBcryptHash(pass, hash) {

	return await bcrypt.compare(pass, hash)
}



function verifyJWT(token) {


    let verifiedToken = jwt.verify(token, config.get('jwt_key'));

    return verifiedToken;

}
exports.verifyJWT = verifyJWT;
exports.verifyBcryptHash = verifyBcryptHash;
exports.makeJWT = makeJWT;
