// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {MsgSendersSimply} from "../src/MsgSendersSimply.sol";

contract DeployMock is Script {
    function run() public {
        // Setup wallet
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Log address
        address deployerAddress = vm.addr(deployerPrivateKey);
        console2.log("Loaded deployer: ", deployerAddress);

        // Create consumer
        MsgSendersSimply mockRitual = new MsgSendersSimply();
        console2.log("Deployed SaysHello: ", address(mockRitual));

        // Execute
        vm.stopBroadcast();
        vm.broadcast();
    }
}
