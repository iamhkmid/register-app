import { request, response } from "express";
import express, { Request, Response } from "express";

const Router = express.Router();

Router.get("/", (req: Request, res: Response) => {
  res.send("auth Route");
});

export default Router;
