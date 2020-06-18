const mysql = require('./../utis/mysql').MySQL;
const common_function = require('./../utis/common_function');

async function login(req, res) {

    const userDetails = await userData(req.body.email);

    if (!userDetails.length) {
        res.send({
            status: 401,
            message: 'Wrong Email'
        })
    }

    const checkPassword = await common_function.verifyBcryptHash(req.body.password, userDetails[0].password);

    if (!checkPassword) {
        res.send({
            status: 401,
            message: 'not authenticated'
        })
    }

    const obj = {
        id: userDetails[0].id
    }
    const token = common_function.makeJWT(obj)

    return res.status(200).json({
        message: "Auth successful",
        token: token
    });

}


async function userData(email) {

    const userDetails = await mysql.query(
        `SELECT 
            id,
            name,
            email,
            password
        FROM
            tb_users
        WHERE
            email = ?`,
        [email], 'e_commerce')

    return userDetails

}

exports.login = login;

