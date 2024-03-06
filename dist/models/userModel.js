import mongoose, { Schema } from 'mongoose';
import slug from 'mongoose-slug-generator';
mongoose.plugin(slug);
const userSchemaSchema = new Schema({
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
}, { timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' } });
const UserModel = mongoose.models.Product || mongoose.model('User', userSchemaSchema);
export default UserModel;
