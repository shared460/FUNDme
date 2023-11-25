describe('FundMe', ()=>{
    
    let contract
    beforeEach(async()=>{
        //deploy contract
        const [deployer] = await hre.ethers.getSigners();
        console.log('deployer -> ',deployer);
        const getContract = await hre.ethers.getContractFactory('FundMe');
    });
    
    describe('constructor', async()=>{
        contract = await contract.deploy();

    })

})

