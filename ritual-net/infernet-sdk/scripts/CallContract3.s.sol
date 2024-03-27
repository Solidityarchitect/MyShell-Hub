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
            0x09c65b66B0be61BBA0100896D3998c93F44783a7
        );

        // 0x0130bae84601e8f8eae02238c6fdd4e7591771dc outputStr
        // 0x09c65b66b0be61bba0100896d3998c93f44783a7 non-outputStr
        // 0x27Fb10d7b8E0B82079c3F4DaEF3957380Ee8Ecaf original

        msgSender.msgSender("hi, we are at new york, do you like this city?");

        vm.stopBroadcast();
    }
}
