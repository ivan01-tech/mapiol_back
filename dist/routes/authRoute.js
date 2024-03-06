import express from 'express';
import { config } from 'dotenv';
import { AuthenticationController } from '../controllers/authController.js';
config();
const authRoute = express.Router();
authRoute
    .post('/login', AuthenticationController.login)
    .get('/logout', AuthenticationController.logout)
    .get('/profile', AuthenticationController.getUserStatus);
export default authRoute;
