const networkConfig = {

    //for sepolia
    11155111: {
        name: 'seploia',
        priceFeedAddress: '0x694AA1769357215DE4FAC081bf1f309aDC325306',
    },

    //for polygon
    137: {
        name: 'polygon',
        priceFeedAddress: '0x0715A7794a1dc8e42615F059dD6e406A6594651A',
    }

    //hardhat network
}

const developmentChains = ['hardhat', 'localhost']

module.exports = {
    networkConfig,
    developmentChains,
}