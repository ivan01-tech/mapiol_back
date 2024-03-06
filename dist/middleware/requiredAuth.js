export const requireAuth = (req, res, next) => {
    if (req.session.userId || req.session.user) {
        next();
    }
    else {
        console.log('session : ', req.session, req.sessionID);
        return res.status(403).json({ status: 'error', menubar: 'UnAuthenticated' });
    }
};
export const ensureAuthenticated = (req, res, next) => {
    if (req.isAuthenticated()) {
        return next();
    }
    res.redirect('/login');
};
