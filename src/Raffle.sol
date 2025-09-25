// Layout of the contract file:
// version
// imports
// errors
// interfaces, libraries, contract
​
// Inside Contract:
// Type declarations
// State variables
// Events
// Modifiers
// Functions
​
// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/**
 * @title A sample Raffle Contract
 * @author Azim Makaev (or even better, you own name)
 * @notice This contract is for creating a sample raffle
 * @dev It implements Chainlink VRFv2.5 and Chainlink Automation
 */
contract Raffle {

    error Raffle__NotEnoughEthSent();
    error Raffle__NoPlayers()
    error Raffle__NotEnoughTimePassed();

    uint256 private immutable i_entranceFee;
    // @dev Duration of the lottery in seconds
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    event EnteredRaffle(address indexed player);

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        emit EnteredRaffle(msg.sender);
    }

    function pickWinner() public {
        if (s_players.length == 0) {
            revert Raffle__NoPlayers();
        }
        if (block.timestamp - s_lastTimeStamp < i_interval) {
            revert Raffle__NotEnoughTimePassed();
        }
    }

    /* Getter functions
    */

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
