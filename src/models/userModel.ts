/* eslint-disable object-curly-newline */
/* eslint-disable comma-dangle */
import mongoose, { Schema, Document, InferSchemaType } from 'mongoose';
// import slug from 'mongoose-slug-generator';

import { USERS_ROLES, USERS_STATUS } from '../constants.js';
import { Sexe } from '../utils/sexeEnum.js';

// mongoose.plugin(slug);

export interface IUser extends Document {
  created_at: Date;
  updated_at: Date;
  deleted_at: Date;
  nom: string;
  adresse: string;
  email: string;
  login: string;
  password: string;
  sexe: Sexe;
  telephone: string;
  roles: USERS_ROLES;
  statut: USERS_STATUS;
}

const userSchemaSchema = new Schema<IUser>(
  {
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
  },
  { timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' } }
);

export type UserType = InferSchemaType<typeof userSchemaSchema>;
const UserModel = mongoose.model('User', userSchemaSchema);

export default UserModel;
