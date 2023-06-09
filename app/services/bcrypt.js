import bcrypt from 'bcrypt';

export const passwordService = {
    hashPassword: async function (password, saltRounds = 10) {
        try {
            // Generate a salt
            const salt = await bcrypt.genSalt(saltRounds);

            // Hash password
            return await bcrypt.hash(password, salt);
        } catch (error) {
            console.log(error);
        }

        // Return null if error
        return null;
    },
    comparePassword: async function (password, hash) {
        try {
        // Compare password
            return await bcrypt.compare(password, hash);
        } catch (error) {
            console.log(error);
        }

        // Return false if error
        return false;
    },
};

// const password = await passwordService.hashPassword('oharvest');
// console.log(password);
