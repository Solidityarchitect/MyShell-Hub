// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {msgSenders} from "../src/msgSenders.sol";

contract DeployMsgSender is Script {
    function run() public {
        // Setup wallet
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Log address
        address deployerAddress = vm.addr(deployerPrivateKey);
        console2.log("Loaded deployer: ", deployerAddress);

        address coordinator = 0x9a047b5FEa6444aE8f945bA418821F496466707c;
        // Create consumer
        msgSenders msgSender = new msgSenders(coordinator);
        console2.log("Deployed msgSenders: ", address(msgSender));

        // Execute
        vm.stopBroadcast();
        vm.broadcast();
    }
}
