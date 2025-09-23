const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
app.get('/health', (req,res)=>res.send('OK'));
app.get('/', (req,res)=>res.json({ msg: 'Hello from Node.js!' }));
app.listen(port, ()=>console.log(`Server on :${port}`));