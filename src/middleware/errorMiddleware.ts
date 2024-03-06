/* eslint-disable operator-linebreak */
/* eslint-disable implicit-arrow-linebreak */
/* eslint-disable indent */
/* eslint-disable quotes */
/* eslint-disable @typescript-eslint/no-explicit-any */
/* eslint-disable brace-style */
/* eslint-disable consistent-return */
// errorHandlerMiddleware.ts

import { NextFunction, Request, Response } from 'express';
import mongoose from 'mongoose';

import { MyCustomError } from '../utils/CustomError.js';

const errorHandlerMiddleware = (err: Error, req: Request, res: Response, next: NextFunction) => {
  console.log('get callback');
  // Handle the error here
  console.error(err);
  if (err instanceof mongoose.Error) {
    // Handle different Mongoose error types gracefully
    if (err.name === 'ValidationError' && err instanceof mongoose.Error.ValidationError) {
      return res.status(400).json({ message: 'Validation error', errors: err.errors });
    }

    if (err.name === 'CastError') {
      res.status(400).json({
        message: err.message,
        status: 'error',
      });
    }

    //  else if (err instanceof mongoose.Error.ValidationError) {
    //   return res.status(400).json({ status: "error", errors: err.errors });
    // }
    else if (err instanceof MyCustomError) {
      return res.status(500).json({ status: 'error', message: err.message });
    } else {
      return res.status(500).json({ message: 'Internal server error (Mongoose)' });
    }
  } else {
    console.log('error : ', err);
    return res.status(500).json({
      status: 'error',
      message: 'Something went wrong!',
    });
  }
};

const errorHandlerFoo =
  (fn: (req: Request, res: Response, next: NextFunction) => Promise<any>) =>
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      await fn(req, res, next);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: "Une erreur s'est produite sur le serveur." });
    }
  };

export class ErrorHandlerClass {
  static handleError(fn: (req: Request, res: Response, next: NextFunction) => Promise<any>) {
    return async (req: Request, res: Response, next: NextFunction) => {
      try {
        await fn(req, res, next);
      } catch (error) {
        console.log('get callback');
        const err = error;
        console.error(err);
        if (err instanceof mongoose.Error) {
          // Handle different Mongoose error types gracefully
          if (err.name === 'ValidationError' && err instanceof mongoose.Error.ValidationError) {
            return res.status(400).json({ message: 'Validation error', errors: err.errors });
          }

          if (err.name === 'CastError') {
            res.status(400).json({
              message: err.message,
              status: 'error',
            });
          }

          //  else if (err instanceof mongoose.Error.ValidationError) {
          //   return res.status(400).json({ status: "error", errors: err.errors });
          // }
          else if (err instanceof MyCustomError) {
            return res.status(500).json({ status: 'error', message: err.message });
          } else {
            return res.status(500).json({ message: 'Internal server error (Mongoose)' });
          }
        } else {
          console.log('error : ', err);
          return res.status(500).json({
            status: 'error',
            message: 'Something went wrong!',
          });
        }
      }
    };
  }
}
export default errorHandlerMiddleware;
