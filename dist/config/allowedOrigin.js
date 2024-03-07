import { config } from 'dotenv';
config();
export const allowedOrigns = [
    'http://localhost:3500',
    'http://localhost:3000',
    'http://127.0.0.1:5500',
    'https://mapiol-frontend.onrender.com',
    process.env.CLIENT_URL,
];
