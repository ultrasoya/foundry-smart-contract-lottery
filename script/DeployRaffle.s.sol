// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {Raffle} from "../src/Raffle.sol";

contract DeployRaffle is Script {

    function deployContract() public returns (Raffle, HelperConfig) {
        vm.startBroadcast();
        Raffle raffle = new Raffle(

        )
    }
    
    // function run() public {
    //     vm.startBroadcast();
    //     new Raffle(
    //         1 ether,
    //         3600,
    //         0x4b09e658ed251bcafeebbc69400383d49f344ace09b9576fe248bb02c003c129,
    //         0x4b09e658ed251bcafeebbc69400383d49f344ace09b9576fe248bb02c003c129,
    //         1,
    //         500000
    //     );
    //     vm.stopBroadcast();
    // }
}
