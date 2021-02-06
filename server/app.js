const express = require("express");
const next = require("next");
const cors = require("cors");

const port = parseInt(process.env.PORT) || 3000;
const dev = process.env.NODE_ENV !== "production";
const nextApp = next({ dev });
const handle = nextApp.getRequestHandler();

nextApp
  .prepare()
  .then(() => {
    const app = express();
    const server = require("http").createServer(app);
    const io = require("socket.io")(server);

    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));
    app.use(cors());

    io.on("connection", (socket) => {
      console.log("connection");
      socket.emit("status", "Hello from Socket.io");

      socket.on("disconnect", () => {
        console.log("client disconnected");
      });
    });

    app.get("/test", (req, res) => {
      res.statusCode = 200;
      res.json([
        { name: "Muhammad Luqmanul Hakim", nim: 124 },
        { name: "Mikhael sitorus", nim: 123 },
      ]);
      res.end();
    });

    app.get("*", (req, res) => {
      return handle(req, res);
    });

    server.listen(port, (err) => {
      if (err) throw err;
      console.log(`Server running on ${port}`);
    });
  })
  .catch((ex) => {
    console.error(ex.stack);
    process.exit(1);
  });
