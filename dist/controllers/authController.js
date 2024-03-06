import { config } from 'dotenv';
import bcrypt from 'bcrypt';
import User from '../models/userModel.js';
config();
export class AuthenticationController {
    static async login(req, res) {
        const { email, password } = req.body;
        if (!email || !password) {
            return res.status(400).json({ status: 'error', message: 'All fields are required!' });
        }
        const checkUser = await User.findOne({ email });
        if (!checkUser) {
            return res.status(401).json({ message: 'Unauthorized ! ', status: 'error' });
        }
        const matchPassword = await bcrypt.compare(password, checkUser.password);
        if (!matchPassword) {
            return res.status(401).json({ message: 'Unauthorized', status: 'error' });
        }
        req.session.user = checkUser;
        req.session.userId = checkUser._id.toString();
        delete checkUser.password;
        console.log('user : ', req.session.id);
        return res.json({
            status: 'success',
            data: checkUser,
            message: 'successfully logged in',
        });
    }
    static async getUserStatus(req, res) {
        const { user: userSession, userId } = req.session;
        const { user } = req;
        console.log('user with get status : ', req.user);
        if (req.user) {
            return res.json({
                status: 'success',
                message: 'Logged in',
                data: user,
            });
        }
        console.log('user service : ', userId, userSession);
        if (!userId && !userSession) {
            return res.status(403).json({ message: 'Not logged in', status: 'error' });
        }
        delete userSession.password;
        return res.json({
            status: 'success',
            message: 'Logged in',
            data: userSession,
        });
    }
    static async logout(req, res) {
        req.session.destroy(() => res.json({ message: 'Logged out successfully', status: 'success' }));
        req.logout({}, (err) => {
            if (err)
                return res.status(500).json({ message: 'Something went wrong!', status: 'success' });
        });
        res.redirect(process.env.CLIENT_URL);
    }
}
