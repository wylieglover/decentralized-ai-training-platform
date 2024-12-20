// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreditDistribution {
    mapping(address => uint256) public balances;

    event CreditsDistributed(address indexed recipient, uint256 amount);

    function distributeCredits(address recipient, uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");

        balances[recipient] += amount;

        emit CreditsDistributed(recipient, amount);
    }

    function getBalance(address recipient) public view returns (uint256) {
        return balances[recipient];
    }
}