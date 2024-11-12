import express, { Router } from "express";
import {booking,View,slots,book} from "../controllers/sessions.js";
const router=express.Router()

router.post("/booking",booking)
router.post("/view",View)
router.post("/slots",slots)
router.post("/book",book)


export default router