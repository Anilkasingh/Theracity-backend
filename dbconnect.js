import mysql from "mysql2"
import dotenv from "dotenv"
dotenv.config({path:'./protected.env'})
export const db=mysql.createConnection({
    host:process.env.host,
    user:process.env.user,
    password: process.env.pass,
    database:process.env.database

})
 db.connect((error)=>{
    if(error)
    {
        console.log(error)
    }
    else{
        console.log("MY SQL CONNECTED...")
    }
 })