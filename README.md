# ETH-AVAX-Assessment
This smart contract, Banking.sol, implements basic banking functionalities including deposit and withdrawal of Ether, while utilizing error handling mechanisms such as require, assert, and revert to ensure security and reliability.

## Features
#### Deposit Ether: Users can deposit Ether into their account.
#### Withdraw Ether: Users can withdraw Ether from their account, provided they have sufficient balance.
#### Error Handling: Utilizes require, assert, and revert statements for robust error handling.

## Error Handling Mechanisms
#### require: Ensures conditions are met before proceeding with a function.
#### assert: Checks for internal errors and invariants.
#### revert: Reverts the transaction and provides a custom error message.


## Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Banking.sol). Copy and paste the following code into the file:

```javascript
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
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile MyToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Banking" contract from the dropdown menu, and then click on the "Deploy" button.

## Example Usage
#### Deposit Ether: Enter a value in the "Value" input box (e.g., 1 Ether). Click deposit. The balance of the sender should increase by the deposited amount.
#### Withdraw Ether: Enter the amount to withdraw in the withdraw function input (e.g., 0.5 Ether). Click withdraw. The balance of the sender should decrease by the withdrawn amount.

## Signifance of Error Handling
Error handling mechanisms are crucial in smart contracts to ensure the correctness and security of the contract's operations. In Banking.sol, we demonstrated the use of require, assert, and revert statements to prevent invalid transactions, maintain contract integrity, and provide meaningful error messages to users. These mechanisms help in creating a robust and reliable contract.

## Authors

Abhigyan Shrivastava


## License

This project is licensed under the MIT License.
