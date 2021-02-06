import axios from "axios";
import io from "socket.io-client";
import { useState, useEffect } from "react";

const endpoint = "http://localhost:3000" || "http://register-app.vercel.app";

export const getStaticProps = async () => {
  const res = await axios.get("/ayam");

  return {
    props: { aku: res.data },
  };
};

const Home = ({ aku }) => {
  const [data, setData] = useState("");
  useEffect(() => {
    const socket = io(endpoint);
    socket.on("status", (data) => {
      setData(data);
    });
  }, []);

  return (
    <div>
      {aku.map((ikan) => (
        <h3 key={ikan.nim}>nama : {ikan.name}</h3>
      ))}
      <h4>socket nama :{data}</h4>
    </div>
  );
};

export default Home;
