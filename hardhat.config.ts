import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("dotenv").config();


import { vars } from "hardhat/config";

const { SEPOLIA_API_KEY_URL, ACCOUNT_PRIVATE_KEY, ETHERSCAN_API_KEY } = process.env;




const config: HardhatUserConfig = {
  solidity: "0.8.28",

networks: {
    
  sepolia: {
    url: SEPOLIA_API_KEY_URL,
    accounts: [`0x${ACCOUNT_PRIVATE_KEY}`],
  },
  
},

etherscan: {
  apiKey:
     ETHERSCAN_API_KEY,
  
},


};

export default config;