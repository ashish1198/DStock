pragma solidity ^0.7.0;

import "./DStockToken.sol";

contract tokenExchange {
    address admin;
    DStockToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event TokenBought(address _buyer, uint256 _amount);
    event TokenRedeemed(address _buyer, uint256 _amount);

    constructor (DStockToken _tokenContract, uint256 _tokenPrice)  {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }

    function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        require(tokenContract.balanceOf(this) >= _numberOfTokens);
        require(tokenContract.transfer(msg.sender, _numberOfTokens));

        tokensSold += _numberOfTokens;
        
        emit TokenBought(msg.sender, _numberOfTokens);
    }
    
    function redeemTokens(address payable _to, uint256 _numberOfTokens ) public{
        require(tokenContract.balanceOf(msg.sender) >= _numberOfTokens);
        require(tokenContract.transferFrom(msg.sender, _to, _numberOfTokens  );
        
        emit tokenContract(msg.sender, _to, _numberOfTokens);
        
    }
}