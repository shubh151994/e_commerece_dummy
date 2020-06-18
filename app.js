

var express = require('express');

const http = require('http');
const config = require('config');
const bodyParser = require('body-parser');
const products = require('./routes/products');
const user = require('./routes/user');
const common_function = require('./utis/common_function');


var app = express();

const port = process.env.PORT || config.get("port");


const middleWare = async (req,res,next) => {
    let data = {};
    try{ data =  common_function.verifyJWT(req.body.token);}
    catch(e){
        return res.send({
            status:401,
            message:"Invalid Token"
        })
    }
    console.log(data);
    req.id = data.id
    next()
  }
  
app.set('port', port);

const server = http.createServer(app);
server.listen(port, () => console.info(`
    **********************
    Server Started:
        Environment: ${app.get('env')}
        Port: ${port}
    **********************
`));


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));


app.post('/addProducts',middleWare,async function (req,res){
     await products.addProduct(req,res);
} );

app.post('/addProductToCart',middleWare,async function (req,res){
    await products.addProductToCart(req,res);
} );

app.post('/userCartDetails',middleWare,async function (req,res){
    await products.userCartDetails(req,res);
} );
app.post('/login',async function (req,res){
    await user.login(req,res);
} );


