import {db} from "../dbconnect.js"

export const View=(req,res)=>{
    const q="SELECT session_id ,time,date,status FROM THERAPY_SESSIONS"
    db.query(q,(err,data)=>{
        if(err){
            return res.status(500).json(err)
        }
        if(data.length()==0)
        {
            return res.status(409).json("No Sessions Found")
        }
        return res.status(200).json(data)

    })

}

export const booking=(req,res)=>{
    const q="SELECT therapist_name FROM THERAPIST"
    db.query(q,(err,data)=>{
    if(err){
        return res.status(500).json(err)
    }
    if(data.length()==0)
    {
        return res.status(409).json("No Sessions Found")
    }
    return res.status(200).json(data)
})


}
export const slots=(req,res)=>
{
    const q="Select * from therapist_available where therapist_id=?"
    db.query(q,[req.body.therapist],(err,data)=>{
        if(err){
            return res.status(500).json(err)
        }
        if(data.length()==0)
        {
            return res.status(409).json("No Slots Available")
        }
        return res.status(200).json(data)

    })
}
export const book=(req,res)=>
    {
        const iq="INSERT INTO THERAPY_SESSIONS (feedback,time,date,status) VALUES (?)";
        const values=['NONE',req.body.time,req.body.date,'Booked']

        db.query(iq,[values],(err,data)=>{
        if(err) return res.status(500).json(err);
        return res.status(200).json("Session Booked");
        });
    }