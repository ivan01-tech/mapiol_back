/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable comma-dangle */
/* eslint-disable no-console */
import path, { join } from 'path';

import passport from 'passport';
import expresssession from 'express-session';
import express from 'express';
import AdminJS from 'adminjs';
import dotenv from 'dotenv';
import cors from 'cors';
import cookieParser from 'cookie-parser';
import mongoose from 'mongoose';
import { Database, Resource } from '@adminjs/mongoose';
import MongoStore from 'connect-mongo';

import { configurePassport } from './config/passport.js';
import { deleteAllDocuments } from './utils/deleteMany.js';
import dbConnection from './config/dbConnection.js';
import { logger } from './middleware/logger.js';
import { corsOptions } from './config/corsCongif.js';
import errLogger from './middleware/errLogger.js';
import errorHandlerMiddleware from './middleware/errorMiddleware.js';
import authRoute from './routes/authRoute.js';
import usersRoute from './routes/userRoute.js';
import rootRouter from './routes/root.js';

dotenv.config();

// Déclaration des constantes
const PORT = process.env.PORT || 3500;
const secretKey = process.env.EXPRESS_SESSION_KEY as string;
const CLIENT_DOMAIN = process.env.CLIENT_DOMAIN as string;
const { DATABASE_URL } = process.env;

const app = express();
const isProduction = process.env.NODE_ENV === 'production';

// Initialisation d'AdminJS
AdminJS.registerAdapter({ Database, Resource });
// MongoStore;
// Fonction principale

const mongoStore = MongoStore.create({
  mongoUrl: DATABASE_URL,
  ttl: 14 * 24 * 60 * 60,
});

const start = async () => {
  // Configuration trust proxy
  app.set('trust proxy', true);

  // Initialisation de la base de données MongoDB
  const mongoDB = await dbConnection();

  configurePassport();

  // Initialisation de la connexion MongoDB
  mongoose.connection.once('open', () => {
    console.log('Connected to MongoDB');
  });

  mongoose.connection.on('error', (err) => {
    console.log(`MongoDB connection error: ${err.message}`);
  });

  const sessionMiddleware = expresssession({
    secret: secretKey,
    resave: true,
    store: mongoStore,
    saveUninitialized: true,
    // store:
    cookie: {
      maxAge: 1000 * 60 * 60 * 10,
      // TODO : change
      secure: isProduction,
      // domain: isProduction ? 'onrender.com' : 'localhost',
      sameSite: isProduction ? 'none' : 'lax',
    },
    name: 'mapiol_cookie',
  });

  // Middlewares généraux
  app.use(logger);
  app.use(cookieParser());
  app.use(cors(corsOptions));
  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));
  app.use(sessionMiddleware);
  app.use(passport.initialize());
  app.use(passport.session());
  app.use('/', express.static(join(process.cwd(), 'src', 'public')));

  // Routes spécifiques
  app.use((req, res, next) => {
    res.header('Access-Control-Allow-Credentials', 'true');
    res.header('Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE, OPTIONS');
    if (req.method === 'OPTIONS') {
      res.sendStatus(200);
    } else {
      next();
    }
  });

  app.use('/api/auth', authRoute);
  app.use('/api/users', usersRoute);
  app.use('/', rootRouter);

  // Catch-all routes
  app.all('/*', (req, res) => {
    res.status(404);

    if (req.accepts('html')) {
      // nothing
    } else if (req.accepts('json')) {
      res.json({ message: 'Not Found !' });
    } else {
      res.type('text').send('Not Found');
    }
  });

  // Gestion des erreurs
  app.use(errLogger);
  app.use(errorHandlerMiddleware);

  // Démarrage du serveur
  app.listen(PORT, () => {
    console.log('Server is running on : ', `http://localhost:${PORT}`);
  });
};

start();
