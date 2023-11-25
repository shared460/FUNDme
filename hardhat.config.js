require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: 'hardhat',
  //adding multiple version of compiler of solidity
  solidity: {
    compilers: [
      {version: '0.8.19'},
      {version: '0.6.6'},
    ]
  },
  networks: {
    sepolia:{
      url: process.env.API_URl,
      accounts:[process.env.PRIVATE_KEY],
      chainId: 11155111,
    }
  },
};
