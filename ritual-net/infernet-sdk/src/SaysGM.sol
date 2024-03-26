// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.13;

import {console2} from "forge-std/console2.sol";
import {CallbackConsumer} from "./consumer/Callback.sol";

contract SaysGM is CallbackConsumer {
    bytes[] public outputs;

    event ComputeReceived(
        uint32 indexed subscriptionId,
        uint32 interval,
        uint16 redundancy,
        address node,
        bytes input,
        bytes output,
        bytes proof
    );

    constructor(address coordinator) CallbackConsumer(coordinator) {}

    function sayGM() public {
        _requestCompute(
            "hello-world", // Container ID for our ML model
            bytes("Good morning"), // Inputs
            20 gwei,
            1_000_000,
            1
        );
    }

    function _receiveCompute(
        uint32 subscriptionId,
        uint32 interval,
        uint16 redundancy,
        address node,
        bytes calldata input,
        bytes calldata output,
        bytes calldata proof
    ) internal override {
        outputs.push(output);

        emit ComputeReceived(
            subscriptionId,
            interval,
            redundancy,
            node,
            input,
            output,
            proof
        );

        console2.log(
            "\n\n"
            "_____  _____ _______ _    _         _\n"
            "|  __ \\|_   _|__   __| |  | |  /\\   | |\n"
            "| |__) | | |    | |  | |  | | /  \\  | |\n"
            "|  _  /  | |    | |  | |  | |/ /\\ \\ | |\n"
            "| | \\ \\ _| |_   | |  | |__| / ____ \\| |____\n"
            "|_|  \\_\\_____|  |_|   \\____/_/    \\_\\______|\n\n"
        );
        console2.log("subscription Id", subscriptionId);
        console2.log("interval", interval);
        console2.log("redundancy", redundancy);
        console2.log("node", node);
        console2.log("input:");
        console2.logBytes(input);
        console2.log("output:");
        console2.logBytes(output);
        console2.log("proof:");
        console2.logBytes(proof);
    }

    function outputsLength() external view returns (uint256) {
        return outputs.length;
    }
}
