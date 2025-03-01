// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import { time } from "@nomicfoundation/hardhat-toolbox/network-helpers";



const ThePiggyBankModule = buildModule("ThePiggyBankModule", (m) => {
  
const __implementation = "0xA1eE1Abf8B538711c7Aa6E2B37eEf1A48021F2bB"
// const _purpose = "Saving for a new car"
// const _duration = time.duration.days(30)
// const _devaddress = "0xA1eE1Abf8B538711c7Aa6E2B37eEf1A48021F2bB"
// const _usdt = "0x51886626449cA9D090850ef59c25579B7D43De7b"
// const _usdc = "0xB9A4406982D990648093C71eFF9F1f63A040152e"
// const _dai = "0x8B96d3487e158c2b53F79C6cD21496dDc4B8Adbf";
  const piggybank = m.contract("PiggyBankFactory", [__implementation]);

  return { piggybank};
});

export default ThePiggyBankModule;
