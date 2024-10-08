// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdleTronProgress {
    struct User {
        uint256 totalCoins;
        uint256 coinsPerSecond;
        uint256[10] producerAmounts;      // Array to hold the amount of each producer
        uint256[10] producerCosts;        // Array to hold the cost of each producer
        uint256[10] producerRevenues;     // Array to hold the revenue of each producer
        bool[10] managerStatuses;          // Array to hold the status of each manager
    }

    mapping(address => User) public users; // Mapping to store user progress

    // Event to log user progress updates
    event UserProgressUpdated(address user, uint256 totalCoins, uint256[10] producerAmounts, uint256[10] producerCosts, uint256[10] producerRevenues, bool[10] managerStatuses);

    // Function to save user progress
    function saveProgress(
        uint256 _totalCoins,
        uint256 _coinsPerSecond,
        uint256[10] memory _producerAmounts,
        uint256[10] memory _producerCosts,
        uint256[10] memory _producerRevenues,
        bool[10] memory _managerStatuses
    ) public {
        User storage user = users[msg.sender]; // Reference to the user's data
        user.totalCoins = _totalCoins;           // Update total coins
        user.coinsPerSecond = _coinsPerSecond;   // Update coins per second
        user.producerAmounts = _producerAmounts;  // Update producer amounts
        user.producerCosts = _producerCosts;      // Update producer costs
        user.producerRevenues = _producerRevenues; // Update producer revenues
        user.managerStatuses = _managerStatuses;  // Update manager statuses

        emit UserProgressUpdated(msg.sender, _totalCoins, _producerAmounts, _producerCosts, _producerRevenues, _managerStatuses);
    }

    // Function to load user progress
    function loadProgress() public view returns (
        uint256 totalCoins,
        uint256 coinsPerSecond,
        uint256[10] memory producerAmounts,
        uint256[10] memory producerCosts,
        uint256[10] memory producerRevenues,
        bool[10] memory managerStatuses
    ) {
        User storage user = users[msg.sender]; // Reference to the user's data
        return (
            user.totalCoins,
            user.coinsPerSecond,
            user.producerAmounts,
            user.producerCosts,
            user.producerRevenues,
            user.managerStatuses
        );
    }
}
