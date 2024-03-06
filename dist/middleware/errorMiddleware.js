import mongoose from 'mongoose';
import { MyCustomError } from '../utils/CustomError.js';
const errorHandlerMiddleware = (err, req, res, next) => {
    console.error(err);
    if (err instanceof mongoose.Error) {
        if (err.name === 'ValidationError' && err instanceof mongoose.Error.ValidationError) {
            return res.status(400).json({ message: 'Validation error', errors: err.errors });
        }
        if (err.name === 'CastError') {
            res.status(400).json({
                message: err.message,
                status: 'error',
            });
        }
        else if (err instanceof MyCustomError) {
            return res.status(500).json({ status: 'error', message: err.message });
        }
        else {
            return res.status(500).json({ message: 'Internal server error (Mongoose)' });
        }
    }
    else {
        console.log('error : ', err);
        return res.status(500).json({
            status: 'error',
            message: 'Something went wrong!',
        });
    }
};
export default errorHandlerMiddleware;
