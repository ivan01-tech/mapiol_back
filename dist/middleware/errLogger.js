import { logEvent } from './logger.js';
const errLogger = async function (err, req, res, _next) {
    await logEvent(`${req.method}\t${req.path}\t${req.headers.origin}\t${err.message}`, 'errLog.log');
    console.log(err.stack);
    _next();
};
export default errLogger;
