import axios from "axios";
import io from "socket.io-client";
import { useState, useEffect } from "react";

const endpoint = "https://register-app-dspskrbbc.vercel.app";
// const endpoint = "http://localhost:3000";

export const getStaticProps = async () => {
  let data;
  try {
    const res = await axios.get(endpoint + "/ayam");
    data = await res.data;
  } catch (err) {
    data = [
      { name: "Muhammad Hakim", nim: 124170004 },
      { name: "Mikhael", nim: 124170008 },
    ];
  }
  return {
    props: { aku: data },
  };
};

const Home = ({ aku }) => {
  const [data, setData] = useState("");
  useEffect(() => {
    try {
      const socket = io(endpoint);
      socket.on("status", (data) => {
        setData(data);
      });
    } catch (err) {}
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
