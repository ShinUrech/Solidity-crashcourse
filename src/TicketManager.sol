// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract TicketManager {
    uint256 price;
    address owner;

    mapping (address => bool) tickets;

    constructor(uint256 _price, address _owner) {
        price = _price;
        owner = _owner;
    }

    function setPrice(uint256 newPrice) public onlyOwner {
        price = newPrice;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Fak you bloody");
        _;
    }

    function buyTicket() payable public{
        require(price == msg.value, "The price is incorrect");
        tickets[msg.sender] = true;
    }

    function hasTicket(address person) public view returns (bool){
        return tickets[person];
    }

    
}
