import rateLimit from 'express-rate-limit';
import { logEvent } from './logger.js';
const loginLimiter = rateLimit({
    windowMs: 60 * 1000,
    max: 5,
    message: 'Too many accounts created from this IP, please try again after a minute',
    async handler(req, res, next, options) {
        logEvent(`To many request ${options.message}\t${req.method}\t${req.url}\t${req.headers.origin}`, 'error.log');
        res.status(options.statusCode).send(options.message);
    },
    standardHeaders: true,
    legacyHeaders: false,
});
export default loginLimiter;
