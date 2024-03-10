
import './App.css';
import idl from "./idl.json";
import {Connection, PublicKey, clusterApiUrl} from "@solana/web3.js"
import {Program, AnchorProvider, web3, utils, BN} from "@project-serum/anchor";

import {useEffect, useState, React} from "react";

const programID = new PublicKey(idl.metadata.address)
const network = clusterApiUrl("devnet");
const opts = {
  preflightCommitment: "processed", 
};
const {SystemProgram} = web3;


const App  = () =>  {

const [walletAddress, setWalletAddress] = useState(null);
const getProvider = () => {
  const connection = new Connection(network, opts.preflightCommitment)
  const provider = new AnchorProvider(connection, window.solana, opts.preflightCommitment);
  return provider;
}
  const checkIfWalletIsConnected = async() => {
    try {
      const {solana} = window;
      if (solana) {
        if(solana.isPhamton) {
          console.log("Phantom Wallet found!!")
          const response = await solana.connect({onlyIfTrusted: true,});
          console.log("Connected with oublic key:", response.publicKey.toString());
          setWalletAddress(response.publicKey.toString());
        }
        else {
          alert("Solana object not found! Get a Phamton Wallet.")
        }
      }

    }catch(error) {
      console.log(error)
    }
  };

  const connectWallet = async() => {
    const {solana } = window;


  };

  const renderNotConnectedContainer = () => {
    <button onClick={connectWallet}> Connect to Wallet</button>
  }

  useEffect( () => {
    const onLoad = async() => {
      await checkIfWalletIsConnected()
    }
    window.addEventListener('load', onLoad)
    return () => window.removeEventListener("load", onLoad);
  }, []);

  return <div className="App"> 
    {!walletAddress && renderNotConnectedContainer()}
  </div>
};

export default App;
