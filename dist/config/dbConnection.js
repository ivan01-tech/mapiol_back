import * as dotenv from 'dotenv';
import mongoose from 'mongoose';
dotenv.config();
const { DATABASE_URL } = process.env;
const dbConnection = async function () {
    try {
        mongoose.set('strictQuery', true);
        const db = await mongoose.connect(DATABASE_URL, {});
        console.log('database : ', DATABASE_URL);
        return db;
    }
    catch (err) {
        console.log('error : ', err);
    }
};
export default dbConnection;
