//SPDX-License-Identifier:MIT
pragma solidity^ 0.8.19;
import "./PriceConverter.sol";
import 'hardhat/console.sol';
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

//getting fund from users
//withdrawing fund
//setting up minimum fund value in USD

error FundMe__NotOwner();

/**
    @title a contract for crowd funding
    @author sharad_poddar 
    @notice this contract is smaple for funding with the help of chainlink
    @dev this implemets price feeds as library
 */
contract FundMe is PriceConverter{

    //type declaration
    uint256 public constant MINIMUM_USD = 50 * 1e18;   //it saves some gas
    address[] public funders;
    mapping(address => uint256) addressToValue;
    address private immutable o_wner;   // it also saves gas and unchangebles

    AggregatorV3Interface public priceFeed;

    constructor(address priceFeedContractAddress){
        //deploying time
        o_wner = msg.sender;
        priceFeed = AggregatorV3Interface(priceFeedContractAddress);
    }

    //used by anyone
    //paying to function
    //1e18 => 1*10**18 deals in wei
    function fund() public payable{
        require(getConversion(msg.value, priceFeed) >= MINIMUM_USD, "send some more USD for fund!");
        //revert on not fullfilling condition
        funders.push(msg.sender);
        addressToValue[msg.sender] = (getConversion(msg.value, priceFeed))/1e18;
    }

    //used by only owner
    function withdraw() public onlyOwner(){
        for(uint256 funderIndex = 0; funderIndex< funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToValue[funder] = 0;
        }    

        //making funders to be blank array
        funders = new address[](0);    //0 objects

        //withdrawn the funds from contract    
        //1. transafer -> returns error
        // payable (msg.sender).transfer(address(this).balance);
        
        //2. send -> returns bool
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "transaction failed");
        
        //3. call -> returns bool and bytes
        (bool callSuccess, bytes memory data) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "txn failed");
        console.log('data -> ',string(data));
        revert();
    }

    modifier onlyOwner{
        if(msg.sender != o_wner){
            revert FundMe__NotOwner();
        }
        _; //means doing the rest of code , its order matters
    }

    //seding eth without data
    receive() external payable{
        fund();
    }

    //sedning eth with data
    fallback() external payable{
        fund();
    }

}