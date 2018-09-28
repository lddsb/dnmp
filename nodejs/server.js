/*
* @Author: lddsb
* @Date:   2018-09-25 15:06:00
* @Last Modified by:   lddsb
* @Last Modified time: 2018-09-25 15:06:15
*/
'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello world\n');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);