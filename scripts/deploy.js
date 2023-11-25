//either work with ethers or hre

const main = async() => {
  try{
    const [deployer] = await hre.ethers.getSigners();
    
    //getting list of accounts 
    console.log('****')
    const accounts = await hre.ethers.getSigners();
    console.log('accounts -> ',accounts);
    console.log('****')

    //getting balance
    const balance = await hre.ethers.provider.getBalance(accounts[0].address);
    console.log(hre.ethers.formatEther(balance));


    //deploying contract
    const getContract = await hre.ethers.getContractFactory('FundMe');
    const contract = await getContract.deploy('0x694AA1769357215DE4FAC081bf1f309aDC325306'); //deploying
    await contract.target;
    
    console.log(`Waiting for blocks confirmations...`);
    await contract.deployTransaction.wait(6);
    console.log(`Confirmed!`);
    
    console.log('deployed receipt .... ',contract);
    console.log('deployed contract address .... ',contract.target);
    console.log('deployer address .... ',deployer);




    process.exit(0);
  }catch(error){
    console.log(error);
    process.exit(1);
  }
}

main();

