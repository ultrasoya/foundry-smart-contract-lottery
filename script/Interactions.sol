// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";

contract CreateSubscription is Script {
    function createSubscriptionUsingConfig() public returns (uint64) {
        vm.startBroadcast();
        VRFCoordinatorV2Mock(vrfCoordinator).createSubscription();
        vm.stopBroadcast();
    }

    function run() external returns (uint64) {
        return createSubscriptionUsingConfig();
    }
}
