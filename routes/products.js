

const mysql = require('./../utis/mysql').MySQL;

async function addProduct(req, res) {

    await mysql.query(
        `INSERT INTO
            tb_products
        (
            name,
            unit_price,
            category_id
        )
        VALUES
        (?,?,?)
    `, [req.body.name, req.body.unit_price, req.body.category_id], 'e_commerce')

    return res.send({
        status: 200, data: 'Prdocut Added SuccessFully'
    });

}


async function addProductToCart(req, res) {

    try {
        await mysql.query(`
            INSERT INTO
            tb_carts
        (
            user_id,
            product_id,
            quantity,
            unit_price,
            status
        )
        VALUES
        (?,?,?,?,?)
    `, [req.id, req.body.product_id, req.body.quantity, req.body.unit_price, 1], 'e_commerce')
    }
    catch (e) {
        return res.send({
            status: 401, error: e
        })
    }
    return res.send({
        status: 200, data: 'Prdocut Added To Cart'
    });
}


async function userCartDetails(req, res) {
    let cartData = [];
    try {
        cartData = await mysql.query(
            `SELECT     
                p.name,
                quantity,
                c.unit_price,
                c.created_at as added_on
            FROM
                tb_carts c
            JOIN
                tb_products p
                ON
                c.product_id  = p.id
            WHERE
                user_id = 1 AND
                status = 1 
            ORDER BY
                c.created_at desc`, [req.body.user_id], 'e_commerce')
    }
    catch (e) {
        return res.send({
            status: 401, error: e
        })
    }
    return res.send({
        status: 200,
        data: cartData
    })

}

exports.addProduct = addProduct;
exports.addProductToCart = addProductToCart;
exports.userCartDetails = userCartDetails;