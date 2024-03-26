// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.0;

import {Script, console2} from "forge-std/Script.sol";
import {SaysGM} from "../src/SaysGM.sol";

contract CallContract2 is Script {
    function run() public {
        // Setup wallet
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        SaysGM saysGm = SaysGM(0x75438975Ad95C1e840E70AeB1b66ed343027B162);
        require(saysGm.outputsLength() > 0, "No outputs available");

        bytes memory output = saysGm.outputs(0);

        console2.logBytes(output);

        vm.stopBroadcast();
    }
}
