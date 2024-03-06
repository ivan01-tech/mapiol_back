import mongoose, { Schema } from 'mongoose';
import { USERS_ROLES, USERS_STATUS } from '../constants.js';
import { Sexe } from '../utils/sexeEnum.js';
const userSchemaSchema = new Schema({
    created_at: { type: Date, default: null },
    updated_at: { type: Date, default: null },
    deleted_at: { type: Date, default: null },
    nom: { type: String, required: true },
    adresse: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    login: { type: String, required: true },
    password: { type: String, required: true },
    telephone: { type: String, required: true, unique: true },
    sexe: { type: String, enum: Object.values(Sexe), required: true },
    roles: { type: String, enum: Object.values(USERS_ROLES), default: USERS_ROLES.USER },
    statut: { type: String, enum: Object.values(USERS_STATUS), default: USERS_STATUS.DSICONNECT },
}, { timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' } });
const UserModel = mongoose.model('User', userSchemaSchema);
export default UserModel;
