pragma solidity ^0.8.18;
// SPDX-License-Identifier: MIT
contract Test {
    address public owner; 
    uint256 public balance;
    constructor() {
        owner = msg.sender;

    }
    receive() payable external {
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficent funds")
        destAddr.transfer(amount);
        balance -= amount;
    }
}