//Implementation of the require(), assert() and revert() statements

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Banking {

    // public variables here
    address public owner;

    // mapping variable here
    mapping(address => uint256) public balances;
    
    // Declaring event Deposit
    event Deposit(address indexed accHolder, uint256 amt);

    // Declaring event Withdrawal
    event Withdrawal(address indexed accHolder, uint256 amt);

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        require(msg.value > 0, "Deposit must be greater than zero");

        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external {
        require(amount <= balances[msg.sender], "Insufficient balance");

        uint256 oldBalance = balances[msg.sender];
        balances[msg.sender] -= amount;

        assert(balances[msg.sender] <= oldBalance);
        payable(msg.sender).transfer(amount);
        
        emit Withdrawal(msg.sender, amount);
    }

}
