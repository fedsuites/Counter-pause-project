//SPDX-License-Identifier:MIT

pragma solidity ^0.8.30;

contract project1{
    uint public count;
    bool public paused;
    address public owner;
   //setting owner
    constructor(){
        owner=msg.sender;
    }
    // checking whether paused or not paused
    modifier whenNotPaused(){
        require(!paused,"the contract is paused");
        _;
    }
    //checking owner
    modifier onlyOwner(){
        require(msg.sender==owner,"you are not the owner");
        _;
    }
      //pausing & unpausing of contract
      function pause(bool _paused)external onlyOwner{
        paused=_paused;
    }
    //increase count
    function inc()public whenNotPaused{
        count++;
    }
    //decrease count
    function dec()public whenNotPaused{
        count--;
    }
    // double the value of count
       function getDouble() public view returns (uint) {
        return count * 2;
    }
    
}