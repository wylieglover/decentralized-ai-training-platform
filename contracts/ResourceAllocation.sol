// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ResourceAllocation {
    struct Resource {
        address contributor;
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => Resource) public resources;
    mapping(address => uint256) public credits;

    event ResourceContributed(address indexed contributor, uint256 amount, uint256 timestamp);
    event CreditsEarned(address indexed contributor, uint256 amount);

    function contributeResource(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");

        resources[msg.sender] = Resource(msg.sender, amount, block.timestamp);
        credits[msg.sender] += amount;

        emit ResourceContributed(msg.sender, amount, block.timestamp);
        emit CreditsEarned(msg.sender, amount);
    }

    function getResource(address contributor) public view returns (Resource memory) {
        return resources[contributor];
    }

    function getCredits(address contributor) public view returns (uint256) {
        return credits[contributor];
    }
}