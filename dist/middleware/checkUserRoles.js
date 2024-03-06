import { userRoles } from '../constants.js';
export const requiredAdminRoles = (req, res, next) => {
    const roles = req.session.user?.roles;
    const isAdmin = roles.includes(userRoles.is_admin);
    if (isAdmin) {
        next();
    }
    else {
        return res.status(403).json({
            status: 'error',
            message: 'Only admins can access this route!',
        });
    }
};
