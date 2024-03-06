import express from 'express';
import passport from 'passport';
import { config } from 'dotenv';
import { AuthenticationController } from '../controllers/authController.js';
config();
const authRoute = express.Router();
authRoute
    .get('/google/callback', passport.authenticate('google', {
    successRedirect: `${process.env.CLIENT_URL}`,
    failureRedirect: '/api/auth/failed',
}), (req, res, next) => {
    console.log('req : ', req.session);
    const { user } = req;
    req.session.user = req.user;
    if (user && typeof user === 'object' && '_id' in user) {
        console.log('serialized user : ', user);
        req.session.userId = user._id.toString();
    }
    return res.redirect('/api/auth/google/success');
})
    .get('/google', passport.authenticate('google', {
    scope: ['profile', 'email'],
}))
    .get('/google/success', (req, res) => {
    console.log('req : user :  ', req.user);
    return res.json({
        status: 'success',
        data: req.user,
        message: 'successful login with  google',
    });
})
    .get('/facebook', passport.authenticate('facebook', {
    failureRedirect: '/api/auth/failed',
    scope: ['email', 'profile', 'id', 'displayName', 'email', 'name', 'photos'],
}), (req, res) => res.redirect('/api/auth/facebook/success'))
    .get('/facebook/callback', passport.authenticate('facebook', {
    successRedirect: process.env.CLIENT_URL,
    failureRedirect: '/api/auth/failed',
}), (req, res) => res.redirect('/api/auth/facebook/success'))
    .get('/facebook/success', (req, res) => {
    return res.json({ status: 'success', data: req.user, message: 'successfully logged in with facebook' });
})
    .get('/failed', (req, res) => {
    return res.status(401).json({
        status: 'error',
        data: req.user,
        message: 'Login failed',
    });
})
    .post('/login', AuthenticationController.login)
    .get('/logout', AuthenticationController.logout)
    .get('/status', AuthenticationController.getUserStatus);
export default authRoute;
