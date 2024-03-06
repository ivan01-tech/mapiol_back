import { join } from 'path';

import express from 'express';

const rootRouter = express.Router();

rootRouter.get('/', (_req, res) => {
  res.sendFile(join(process.cwd(), 'src', 'public', 'html', 'index.html'));
});

export default rootRouter;
