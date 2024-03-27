// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.0;

import {Script, console2} from "forge-std/Script.sol";
import {msgSenders} from "../src/msgSenders.sol";

contract CallContract3 is Script {
    function run() public {
        // Setup wallet
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        msgSenders msgSender = msgSenders(
            0x27Fb10d7b8E0B82079c3F4DaEF3957380Ee8Ecaf
        );

        msgSender.msgSender("hi, we are at new york, do you like this city?");

        vm.stopBroadcast();
    }
}
