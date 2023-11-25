const { developmentChains } = require('../helper-config')
const { network } = require('hardhat')

const main = async() => {
    
    const DECIMALS = 8;
    const INITIAL_ANSWER = 200000000000;
    // const chainId = network.config.chainId;
    
    //deploying with chain name, this is diiferent method
    if(developmentChains.includes(network.name)){
        const [ deployer ] = await hre.ethers.getSigners();
        console.log(deployer);
        
        console.log('local network detected! deploying mocks... ');
        const getContract = await hre.ethers.getContractFactory('MockV3Aggregator');
        const contract = await getContract.deploy(DECIMALS, INITIAL_ANSWER);
        await contract.target;

        console.log('contract deployed address -> ',contract.target);
        console.log('local network detected! deploying mocks... ');

        console.log('------')
    }
}

main();

//especial tags for running
// module.exports.tags = ['all', 'mocks'];