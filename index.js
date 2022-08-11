const NODE_ENV = process.env.NODE_ENV;

require('dotenv').config({ path: `.env.${NODE_ENV}` })
const express = require('express');
const cookieParser = require('cookie-parser');
const cors = require('cors');
const db = require('./src/config/db.config');

const app = express();

// Database
db.sequelize.sync();

app.disable('x-powered-by');
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.text());
app.use(cookieParser());
app.use(cors({ origin: true, credentials: true }));
app.use('/public', express.static('public'));

const srcRoutes = './src/routes';

const authRoutes = require(`${srcRoutes}/auth.route`);
const userRoutes = require(`${srcRoutes}/user.route`);
const withdrawRoutes = require(`${srcRoutes}/withdraw.route`);
const depositRoutes = require(`${srcRoutes}/deposit.route`);
const transferRoutes = require(`${srcRoutes}/transfer.route`);
const paymentRoutes = require(`${srcRoutes}/payment.route`);
const settingRoutes = require(`${srcRoutes}/setting.route`);
const currencyRoutes = require(`${srcRoutes}/currency.route`);
const exchangeRoutes = require(`${srcRoutes}/exchange.route`);
const walletRoutes = require(`${srcRoutes}/wallet.route`);
const kycRoutes = require(`${srcRoutes}/kyc.route`);
const methodRoutes = require(`${srcRoutes}/method.route`);
const linkedRoutes = require(`${srcRoutes}/linked.route`);
const merchantRoutes = require(`${srcRoutes}/merchant.route`);
const requestRoutes = require(`${srcRoutes}/request.route`);
const payRoutes = require(`${srcRoutes}/pay.route`);
const pageRoutes = require(`${srcRoutes}/page.route`);

const apiRoutes = '/api';
app.use(apiRoutes,
   [
      authRoutes,
      userRoutes,
      withdrawRoutes,
      depositRoutes,
      transferRoutes,
      paymentRoutes,
      settingRoutes,
      currencyRoutes,
      exchangeRoutes,
      walletRoutes,
      kycRoutes,
      methodRoutes,
      linkedRoutes,
      merchantRoutes,
      requestRoutes,
      payRoutes,
      pageRoutes,
   ]);

app.get('/', function (req, res) {
   NODE_ENV == 'development' ? res.send('Running...') : res.redirect(process.env.BASE_URL);
   console.log(`Environment : ${NODE_ENV}`);
});

const port = process.env.PORT || 3002;

app.listen(port, (err) => {
   if (err) throw err;
   console.log(`Ready on http://localhost:${port}`);
});
