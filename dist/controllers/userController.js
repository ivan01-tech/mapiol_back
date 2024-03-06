var _a;
import { validationResult } from 'express-validator';
import bcrypt from 'bcrypt';
import mongoose, { Error } from 'mongoose';
import { ErrorHandlerClass } from '../middleware/errorMiddleware.js';
import { MyCustomError } from '../utils/CustomError.js';
import { SALT_HASH } from '../constants.js';
import User from '../models/userModel.js';
export class UserController {
    static async createUserAndLogin(req, res) {
        const { email, password } = req.body;
        if (!email || !password) {
            return res.status(400).json({ status: 'error', message: 'All fields must be set' });
        }
        const user = await User.findOne({
            $or: [{ email }],
        })
            .select('-password')
            .lean()
            .exec();
        if (user) {
            return res.status(409).json({ status: 'Error', message: 'The user already exist' });
        }
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
    static async changeUserRoles(req, res) {
        try {
            const { roles, userId } = req.body;
            if (!roles || !roles.length)
                return res.status(400).json({ status: 'error', message: 'bad credentails !' });
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
        }
        catch (error) {
            if (error instanceof Error.ValidationError) {
                const validationErrors = {};
                Object.keys(error.errors).forEach((key) => {
                    validationErrors[key] = error.errors[key].message;
                });
                res.status(400).json({ errors: validationErrors });
            }
            else if (error instanceof MyCustomError) {
                return res.status(500).json({ status: 'error', message: error.message });
            }
            else {
                console.log('error : ', error);
                return res.status(500).json({
                    status: 'error',
                    message: "Erreur lors de la création de l'utilisateur.",
                });
            }
        }
    }
    static async getAllUsers(req, res) {
        try {
            console.log('session : ', req.session, req.sessionID);
            const users = await User.find({}).select('-password').lean().exec();
            return res.json({ status: 'success', data: users });
        }
        catch (error) {
            console.log('error : ', error);
            return res.status(500).json({ status: 'error', message: 'Somethinfg went wrong !' });
        }
    }
    static async getUserById(req, res) {
        try {
            const { userId } = req.params;
            if (!mongoose.isValidObjectId(userId)) {
                return res.status(400).json({ status: 'error', message: 'Invalid user ID.' });
            }
            const users = await User.findById(userId).select('-password').lean().exec();
            if (!users)
                return res.status(404).json({ status: 'error', message: 'No users found !' });
            return res.json({ status: 'success', data: users });
        }
        catch (error) {
            console.log('error : ', error);
            return res.status(500).json({ status: 'error', message: 'Somethinfg went wrong !' });
        }
    }
    static async deleteUser(req, res) {
        const { userId } = req.body;
        if (!mongoose.isValidObjectId(userId)) {
            return res.status(400).json({ status: 'error', message: 'Invalid user ID.' });
        }
        const users = await User.findById(userId);
        if (!users)
            return res.status(404).json({ status: 'error', message: 'No users found !' });
        await users.deleteOne();
        return res.json({ status: 'success', message: 'Successfully Deleted !' });
    }
    static async updateUser(req, res) {
        try {
            const { userId } = req.params;
            if (!mongoose.isValidObjectId(userId)) {
                return res.status(400).json({ status: 'error', message: 'Invalid user ID.' });
            }
            const user = await User.findById(userId);
            if (!user)
                return res.status(404).json({ status: 'error', message: 'No users found !' });
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
        }
        catch (error) {
            if (error instanceof Error.ValidationError) {
                const validationErrors = {};
                Object.keys(error.errors).forEach((key) => {
                    validationErrors[key] = error.errors[key].message;
                });
                res.status(400).json({ errors: validationErrors });
            }
            else if (error instanceof MyCustomError) {
                return res.status(500).json({ status: 'error', message: error.message });
            }
            else {
                console.log('error : ', error);
                return res.status(500).json({
                    status: 'error',
                    message: "Erreur lors de la création de l'utilisateur.",
                });
            }
        }
    }
}
_a = UserController;
UserController.create = ErrorHandlerClass.handleError(async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ status: 'error', errors: errors.array() });
    }
    const { nom, adresse, email, login, password, telephone, sexe } = req.body;
    const existingUser = await User.findOne({ email });
    console.log('existing : ', existingUser);
    if (existingUser) {
        return res.status(400).json({ errors: [{ msg: 'Cet email est déjà utilisé' }] });
    }
    const hashPassword = await bcrypt.hash(password, SALT_HASH);
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
    req.session.userId = newUser._id;
    req.session.user = newUser;
    return res.status(201).json({
        data: newUser.toJSON(),
        status: 'success',
        message: 'Compte créé avec succès',
    });
});
UserController.createUser = ErrorHandlerClass.handleError(async (req, res) => {
    const { email, password, nom, adresse, login, sexe, telephone } = req.body;
    if (!email || !password) {
        return res.status(400).json({ status: 'error', message: 'All fields must be set' });
    }
    const user = await User.findOne({
        $or: [{ email }],
    })
        .select('-password')
        .lean()
        .exec();
    if (user) {
        return res.status(409).json({ status: 'Error', message: 'The user already exist' });
    }
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
