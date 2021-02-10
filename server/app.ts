import express, { Request, Response } from "express";
import * as http from "http";
import socketIo, { Socket } from "socket.io";
import next from "next";
import cors from "cors";
import morgan from "morgan";
import authRoutes from "./routes/authRoutes";

const port = parseInt(process.env.PORT) || 3000;
const dev = process.env.NODE_ENV !== "production";
const nextApp = next({ dev });
const handle = nextApp.getRequestHandler();

nextApp
  .prepare()
  .then(() => {
    const app = express();
    const server = http.createServer(app);
    const io: socketIo.Server = require("socket.io")(server);

    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));
    app.use(cors());
    app.use(morgan("dev"));

    io.on("connection", (socket: Socket) => {
      console.log("connection");
      socket.emit("status", "Hello from Socket.io");

      socket.on("disconnect", () => {
        console.log("client disconnected");
      });
    });

    app.use("/api/auth", authRoutes);

    app.get("/test", (req: Request, res: Response) => {
      res.statusCode = 200;
      res.json([
        { name: "Muhammad Luqmanul Hakim", nim: 124 },
        { name: "Mikhael sitorus", nim: 123 },
      ]);

      res.end();
    });

    app.get("*", (req: Request, res: Response) => {
      return handle(req, res);
    });

    server.listen(port, (err?: any) => {
      if (err) throw err;
      console.log(`Server running on ${port}`);
    });
  })
  .catch((ex) => {
    console.error(ex.stack);
    process.exit(1);
  });
