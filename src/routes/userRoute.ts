/* eslint-disable comma-dangle */
/* eslint-disable quotes */
import express from 'express';
import { body } from 'express-validator';

import { UserController } from '../controllers/userController.js';
import { SEXES } from '../utils/sexeEnum.js';

const usersRoute = express.Router();

usersRoute
  .post(
    '/register',
    [
      body('nom').notEmpty().withMessage('Le nom est obligatoire'),
      body('adresse').notEmpty().withMessage("L'adresse est obligatoire"),
      body('email').isEmail().withMessage("L'email n'est pas valide"),
      body('password').isLength({ min: 4 }).withMessage('Le mot de passe doit avoir au moins 4 caractères'),
      body('login').notEmpty().withMessage('Le login est obligatoire'),
      body('telephone').notEmpty().withMessage('Le numéro de téléphone est obligatoire'),
      body('sexe').isIn(SEXES).withMessage('Le sexe doit être "M" ou "F"'),
    ],
    UserController.create
  )
  .get('/', UserController.getAllUsers);

export default usersRoute;
