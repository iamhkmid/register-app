import axios from "axios";
import io from "socket.io-client";
import { useEffect, useState } from "react";

const endpoint = "https://register-app-upnyk.herokuapp.com";
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
    props: { dia: data },
  };
};

const Home = ({ dia }) => {
  const [aku, setAku] = useState("");

  useEffect(() => {
    const socket = io(endpoint);
    socket.on("status", (data) => {
      setAku(data);
    });
  }, []);

  return (
    <div>
      {dia.map((ikan) => (
        <h3 key={ikan.nim}>nama : {ikan.name}</h3>
      ))}
      <h4>message: {aku}</h4>
    </div>
  );
};

export default Home;
