require('babel-register');
require('babel-polyfill');
const HDWalletProvider = require('truffle-hdwallet-provider');
const mnemonic = "organ beauty athlete water front spin fruit stand bicycle domain normal solution";
//const rpcUrl = "http://134.209.8.163:7978";

//var Web3 = require('web3');
//var provider = new Web3.providers.HttpProvider("http://134.209.8.163:7978");

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      //from: "0xd1d10607F7aa91F9Cad225C7f8053f3A837874d3",
      network_id: "*" // Match any network id
    },
    rpc: {
      provider: () => new HDWalletProvider(mnemonic,"https://rinkeby.infura.io/v3/60300db3f5ea41c0a436b4ccec0d53b3"),
      // Match any network id
      network_id: "*",
      from: "0xF4bB356632CCF6e01dfbc19BcB2C9987FfbAcA69",
      // Since Quorum is used, gas price can be set to 0
      gasPrice: 0,
      // Gas limit
      //gas: 7500000
    }
  },
  contracts_directory: './src/contracts/',
  contracts_build_directory: './src/abis/',
  compilers: {
    solc: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}
