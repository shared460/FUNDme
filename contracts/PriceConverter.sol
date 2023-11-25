//SPDX-License-Identifier:MIT
pragma solidity^ 0.8.19;
import 'hardhat/console.sol';

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConverter{

    function getPrice(AggregatorV3Interface priceFeed) internal view returns(uint256){
        //address -> 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI -> it is interfaces
        (,int256 answer,,,) = priceFeed.latestRoundData();   //this is the price of ETH in usd
        uint256 price = uint256(answer);
        console.log('amount of 1_ethers is in usd : ',price);
        return uint256(answer * 1e10);
    }

    function getConversion(uint256 _ethAmount, AggregatorV3Interface priceFeed) internal view returns(uint256){
        uint256 priceOf_1_Eth= getPrice(priceFeed);   //it gives us usd * 1e18
        uint256 priceOfAmount = (priceOf_1_Eth * _ethAmount)/1e18;   //here eth_amount is in wei means 1e18
        console.log('amount of _ethers is in usd : ',priceOfAmount);
        return priceOfAmount;
    }

    // function getVersion() internal view returns(uint256){
    //     uint256 version = priceFeed.version();
    //     console.log('version -> ',version);
    //     return(version);
    // }

}