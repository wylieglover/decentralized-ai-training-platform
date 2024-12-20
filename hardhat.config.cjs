require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

module.exports = {
  solidity: "0.8.0",
  networks: {
    sepolia: {
      url: "https://sepolia.infura.io/v3/58fe1ba825b5413593ff576df1f78809",
      accounts: [process.env.PRIVATE_KEY]
    }
  }
};