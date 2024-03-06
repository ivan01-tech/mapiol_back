export const PROCESS_CWD = process.cwd();
export const userRoles = {
    is_admin: 'ADMIN',
    is_user: 'USER',
};
export const USER_ROLES = ['ADMIN', 'USER'];
export const SALT_HASH = 10;
export var USERS_ROLES;
(function (USERS_ROLES) {
    USERS_ROLES["ADMIN"] = "ADMIN";
    USERS_ROLES["USER"] = "USER";
})(USERS_ROLES || (USERS_ROLES = {}));
export var USERS_STATUS;
(function (USERS_STATUS) {
    USERS_STATUS["CONNECT"] = "CONNECT";
    USERS_STATUS["DSICONNECT"] = "DSICONNECT";
})(USERS_STATUS || (USERS_STATUS = {}));
export const PHONE_NUMBER_REGEX = /(\+237|237)\s(6|2)(2|3|[5-9])[0-9]{7}/;
export const EMAIL_REGEX = /\S+@\S+\.\S+/;
export const PASSWORD_REGEX = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
