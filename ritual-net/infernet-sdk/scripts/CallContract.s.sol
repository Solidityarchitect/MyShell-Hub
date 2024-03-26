// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.0;

import {Script, console2} from "forge-std/Script.sol";
import {SaysGM} from "../src/SaysGM.sol";

contract CallContract is Script {
    function run() public {
        // Setup wallet
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        SaysGM saysGm = SaysGM(0x68f8F91e99148Ff6b6a4DC0C4a675b9ADbA580A6);

        saysGm.sayGM();

        vm.stopBroadcast();
    }
}
