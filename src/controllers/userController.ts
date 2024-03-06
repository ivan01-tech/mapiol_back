/* eslint-disable object-curly-newline */
/* eslint-disable quotes */
/* eslint-disable consistent-return */
/* eslint-disable no-unused-expressions */
/* eslint-disable camelcase */

import { Request, Response } from 'express';
import { validationResult } from 'express-validator';
import bcrypt from 'bcrypt';
import mongoose, { Error } from 'mongoose';

import { ErrorHandlerClass } from '../middleware/errorMiddleware.js';
import { MyCustomError } from '../utils/CustomError.js';
import { SALT_HASH } from '../constants.js';
import User from '../models/userModel.js';

export class UserController {
  static create = ErrorHandlerClass.handleError(async (req: Request, res: Response) => {
    // Vérifiez les erreurs de validation
    const errors = validationResult(req);
    // console.log('existing newUser : ', errors);

    if (!errors.isEmpty()) {
      return res.status(400).json({ status: 'error', errors: errors.array() });
    }

    // Extraire les données du corps de la requête
    const { nom, adresse, email, login, password, telephone, sexe } = req.body;

    // Vérifiez si l'utilisateur avec cet e-mail existe déjà
    const existingUser = await User.findOne({ email });

    console.log('existing : ', existingUser);

    if (existingUser) {
      return res.status(400).json({ errors: [{ msg: 'Cet email est déjà utilisé' }] });
    }

    const hashPassword = await bcrypt.hash(password, SALT_HASH);

    // Créez un nouvel utilisateur
    const newUser = new User({
      nom,
      adresse,
      email,
      login,
      password: hashPassword,
      telephone,
      sexe,
    });

    newUser.save();

    delete newUser.password;

    // Connectez l'utilisateur après la création
    req.session.userId = newUser._id;
    req.session.user = newUser;
    // Réponse réussie
    return res.status(201).json({
      data: newUser.toJSON(),
      status: 'success',
      message: 'Compte créé avec succès',
    });
  });

  /**
   * @desc create a new user
   * @route POST /users
   * @access Public
   * @param req
   * @param res
   * @returns
   */
  static createUser = ErrorHandlerClass.handleError(async (req: Request, res: Response) => {
    const { email, password, nom, adresse, login, sexe, telephone } = req.body;

    if (!email || !password) {
      return res.status(400).json({ status: 'error', message: 'All fields must be set' });
    }

    // chek for duplicating
    const user = await User.findOne({
      $or: [{ email }],
    })
      .select('-password')
      .lean()
      .exec();

    if (user) {
      // conflict
      return res.status(409).json({ status: 'Error', message: 'The user already exist' });
    }

    // hashing password
    const hashPassword = await bcrypt.hash(password, SALT_HASH);

    const newUser = await User.create({
      email,
      password: hashPassword,
    });
    if (newUser) {
      const data = {
        email,
        _id: newUser._id,
        roles: newUser.roles,
      };
      console.log('newuser : ', data);

      return res.status(201).send({
        status: 'Success',
        message: "Création  d'un nouvel utilisateur avec succès",
        data,
      });
    }
    return res.status(400).json({ message: 'Invalid user data received !', data: newUser });
  });

  /**
   * @desc create a new user and login it directly from the agent
   * @route POST /users
   * @access Public
   * @param req
   * @param res
   * @returns
   */
  static async createUserAndLogin(req: Request, res: Response) {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({ status: 'error', message: 'All fields must be set' });
    }

    // chek for duplicating
    const user = await User.findOne({
      $or: [{ email }],
    })
      .select('-password')
      .lean()
      .exec();

    if (user) {
      // conflict
      return res.status(409).json({ status: 'Error', message: 'The user already exist' });
    }

    // hashing password
    const hashPassword = await bcrypt.hash(password, SALT_HASH);

    const newUser = await User.create({
      email,
      password: hashPassword,
    });

    if (newUser) {
      const data = {
        email,
        _id: newUser._id,
        roles: newUser.roles,
      };

      req.session.user = newUser;
      req.session.userId = newUser._id.toString();

      delete newUser.password;

      return res.status(201).send({
        status: 'Success',
        message: "Création  d'un nouvel utilisateur avec succès",
        data,
      });
    }
    return res.status(400).json({ message: 'Invalid user data received !', data: newUser });
  }

  /**
   * @desc update user role
   * @route POST /users/change_role
   * @access Private
   * @param req
   * @param res
   * @returns
   */
  static async changeUserRoles(req: Request, res: Response) {
    try {
      const { roles, userId } = req.body;

      if (!roles || !roles.length) return res.status(400).json({ status: 'error', message: 'bad credentails !' });
      console.log('user: ', userId);
      if (!mongoose.isValidObjectId(userId)) {
        return res.status(400).json({ status: 'error', message: 'Invalid user ID.' });
      }

      const user = await User.findById(userId);

      if (!user) {
        return res.status(404).json({
          status: 'error',
          message: `User with ${userId} not found !`,
        });
      }

      user.roles = roles;
      const update = await user.save();
      if (update) {
        return res.status(200).json({
          status: 'success',
          data: update,
          message: 'successfully changed user role  ',
        });
      }
      return res.status(404).json({
        status: 'error',
        message: 'Something went wrong !',
      });
    } catch (error) {
      // Vérifiez si l'erreur est une erreur de validation de Mongoose
      if (error instanceof Error.ValidationError) {
        const validationErrors: { [key: string]: string } = {};

        // Itérer sur les erreurs de validation et les stocker dans un objet
        Object.keys(error.errors).forEach((key) => {
          validationErrors[key] = (error as Error.ValidationError).errors[key].message;
        });

        res.status(400).json({ errors: validationErrors });
      } else if (error instanceof MyCustomError) {
        return res.status(500).json({ status: 'error', message: error.message });
      } else {
        console.log('error : ', error);
        // Si ce n'est pas une erreur de validation, renvoyez une réponse d'erreur générique
        return res.status(500).json({
          status: 'error',
          message: "Erreur lors de la création de l'utilisateur.",
        });
      }
    }
  }

  /**
   * @desc get all users
   * @route GET /users
   * @access Private
   * @param req
   * @param res
   * @returns
   */
  static async getAllUsers(req: Request, res: Response) {
    try {
      console.log('session : ', req.session, req.sessionID);
      const users = await User.find({}).select('-password').lean().exec();
      // if (!users.length) return res.status(404).json({ status: 'error', message: 'No users found !' });

      return res.json({ status: 'success', data: users });
    } catch (error) {
      console.log('error : ', error);
      return res.status(500).json({ status: 'error', message: 'Somethinfg went wrong !' });
    }
  }

  /**
   * @desc get a single user
   * @route GET /users/:userid
   * @access Private
   * @param req
   * @param res
   * @returns
   */
  static async getUserById(req: Request, res: Response) {
    try {
      const { userId } = req.params;

      if (!mongoose.isValidObjectId(userId)) {
        return res.status(400).json({ status: 'error', message: 'Invalid user ID.' });
      }
      const users = await User.findById(userId).select('-password').lean().exec();

      if (!users) return res.status(404).json({ status: 'error', message: 'No users found !' });

      return res.json({ status: 'success', data: users });
    } catch (error) {
      console.log('error : ', error);
      return res.status(500).json({ status: 'error', message: 'Somethinfg went wrong !' });
    }
  }

  /**
   * @desc delete a single user
   * @route GET /users/
   * @access Private
   * @param req
   * @param res
   * @returns
   */
  static async deleteUser(req: Request, res: Response) {
    const { userId } = req.body;

    if (!mongoose.isValidObjectId(userId)) {
      return res.status(400).json({ status: 'error', message: 'Invalid user ID.' });
    }
    const users = await User.findById(userId);

    if (!users) return res.status(404).json({ status: 'error', message: 'No users found !' });
    // TODO
    await users.deleteOne();
    return res.json({ status: 'success', message: 'Successfully Deleted !' });
  }

  /**
   * @desc upadate a  user
   * @route PATCH /users/:userId
   * @access private
   * @param req
   * @param res
   * @returns json
   */
  static async updateUser(req: Request, res: Response) {
    try {
      const { userId } = req.params;
      // const {} = req.body;

      if (!mongoose.isValidObjectId(userId)) {
        return res.status(400).json({ status: 'error', message: 'Invalid user ID.' });
      }
      // chek for user
      const user = await User.findById(userId);

      if (!user) return res.status(404).json({ status: 'error', message: 'No users found !' });

      const ipdateuser = await user.save();
      console.log('updated : ', ipdateuser);
      if (ipdateuser) {
        return res.json({
          status: 'Success',
          message: 'Successfully updated !',
          data: ipdateuser,
        });
      }
      return res.status(400).json({ message: 'Invalid user data received', data: user });
    } catch (error) {
      // Vérifiez si l'erreur est une erreur de validation de Mongoose
      if (error instanceof Error.ValidationError) {
        const validationErrors: { [key: string]: string } = {};

        // Itérer sur les erreurs de validation et les stocker dans un objet
        Object.keys(error.errors).forEach((key) => {
          validationErrors[key] = (error as Error.ValidationError).errors[key].message;
        });

        res.status(400).json({ errors: validationErrors });
      } else if (error instanceof MyCustomError) {
        return res.status(500).json({ status: 'error', message: error.message });
      } else {
        console.log('error : ', error);
        // Si ce n'est pas une erreur de validation, renvoyez une réponse d'erreur générique
        return res.status(500).json({
          status: 'error',
          message: "Erreur lors de la création de l'utilisateur.",
        });
      }
    }
  }
}
