import express from 'express';
import cors from 'cors';
const bodyparser=require('body-parser');
const {Server} =require('socket.io')
const app =express();
const io=new Server();
import {db} from './dbconnect.js'
import authroutes from './routers/login.js'
import sesroutes from './routers/sessions.js'
app.use(express.json());
app.use(cors())

app.use("/",authroutes)
app.use("/Book-session",sesroutes)
app.use(bodyparser.json());

io.on("connection",(socket)=>{})
app.listen(5001,()=>
{
    console.log("server started on port 5001");
})
io.listen(5002);




