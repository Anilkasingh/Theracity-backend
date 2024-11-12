import {db} from "../dbconnect.js";
import bcrypt from "bcryptjs";
export const register=(req,res)=>{
   const q="SELECT * FROM USERS WHERE NAME=?  "
   db.query(q,[req.body.username],(err,data)=>{
    if(err) return res.status(500).json(err)
    if(data.length) return res.status(409).json("user already exsts!")

    const salt=bcrypt.genSaltSync(10);
    const hashedPassword=bcrypt.hashSync(req.body.password,salt);

    const iq="INSERT INTO USERS(USERNAME,EMAIL,PASSWORD,NAME) VALUES (?)";
    const values=[req.body.username,req.body.email,hashedPassword,req.body.name]

    db.query(iq,[values],(err,data)=>{
        if(err) return res.status(500).json(err);
        return res.status(200).json("user created");
    });
   });
}

export const login=(req,res)=>{
    const p="SELECT * FROM USERS WHERE USERNAME=?"
    db.query(p,[req.body.username],(err,data)=>{
        if(err) return res.status(500).json(err);
        if(data.length==0) return res.status(407).json("user not found");
        const pass=bcrypy.compareSync(req.body.password,data[0].password)
        if(!pass) return res.status(406).json("Wrong password or username")

    });
}
export const logout=(req,res)=>{
    res.status(200).json("User has been logged out");
     
 }