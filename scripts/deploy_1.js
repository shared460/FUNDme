//main function 
//calling

const { network } = require("hardhat");
const { networkConfig } = require('../helper-config');


const main = async() => {
    const chainId = network.config.chainId;

    const addressOfContractInterface = networkConfig[chainId]['priceFeedAddress'];
    console.log('getting address ....',addressOfContractInterface);

    const [ deployer ] = await hre.ethers.getSigners();
    console.log(deployer);
    
    const getContract = await hre.ethers.getContractFactory('FundMe');
    const contract = await getContract.deploy(addressOfContractInterface);
    await contract.target;

    console.log('address of contract -> ',contract.target)    
}

main();

//address of deployed contract -> 0x747C111a56f45A7EdB8C2E0b88cB0971556bd493