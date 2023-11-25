//SPDX-License-Identifier:MIT

pragma solidity^ 0.8.19;
contract FallBack{
    uint256 public result;

    //sending an eth without any data calls automatically
    receive() external payable{
        result = 1;
    }

    //it works even when data is send
    fallback() external payable{
        result = 2;
    }
    
}