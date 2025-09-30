
// SPDX-License-Identifier: MIT
pragma solidity >0.8.15 < 0.9.0;



contract ContractModifiersExample {

    address public owner;
    string public message;


    modifier isOwner() {
        // if the person who calls the function is not the owner we revert the execution
        require(msg.sender == owner, "You need to be the owner in order to update the message");
        // if the person who calls the function is the owner we continue with the execution
        _;
    }

    constructor() {
        owner = msg.sender;
    }


    function updateMessage(string memory newMessage) public isOwner { 
        message = newMessage;
    }
}



contract ContractExample {
    address public owner;
    string public message;

    // assign address to the owner variable once contract is deployed
    constructor() {
        owner = msg.sender;
    }

    // here we check if the person who updates message var is the actual owner if not we revert the execution
    function updateMessage(string memory newMessage) public  {
        // we may refactor this piece of code to avoid repetition
        if (msg.sender != owner) {
            revert("You need to be the owner in order to update the message");
        } 
        
        message = newMessage;        
        
    }
}



