/* eslint-disable object-curly-newline */
/* eslint-disable comma-dangle */
import mongoose, { Schema, Document, InferSchemaType } from 'mongoose';
import slug from 'mongoose-slug-generator';

mongoose.plugin(slug);

export interface IUser extends Document {
  created_at: Date;
  updated_at: Date;
  deleted_at: Date;
  nom: string;
  adresse: string;
  email: string;
  login: string;
  password: string;
  sexe: string;
  telephone: string;
  typeUser_id: number;
  statut: string;
  slug: string;
}

const userSchemaSchema = new Schema<IUser>(
  {
    created_at: { type: Date, default: null },
    updated_at: { type: Date, default: null },
    deleted_at: { type: Date, default: null },
    nom: { type: String, required: true },
    adresse: { type: String, required: true },
    email: { type: String, required: true },
    login: { type: String, required: true },
    password: { type: String, required: true },
    sexe: { type: String, required: true },
    telephone: { type: String, required: true },
    typeUser_id: { type: Number, required: true },
    statut: { type: String, required: true },
    slug: {
      type: String,
      slug: 'nom',
      unique: true,
    },
  },
  { timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' } }
);

export type UserType = InferSchemaType<typeof userSchemaSchema>;
const UserModel = mongoose.models.Product || mongoose.model('User', userSchemaSchema);
export default UserModel;
