// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.13;

//import {console2} from "forge-std/console2.sol";
import {CallbackConsumer} from "./consumer/Callback.sol";

contract msgSenders is CallbackConsumer {
    constructor(address coordinator) CallbackConsumer(coordinator) {}

    function msgSender(bytes memory input) public {
        _requestCompute("lepton_node", input, 20 gwei, 1_000_000, 1);
    }

    event ComputeReceived(
        uint32 subscriptionId,
        uint32 interval,
        uint16 redundancy,
        address node,
        bytes input,
        bytes output,
        bytes proof
    );

    function _receiveCompute(
        uint32 subscriptionId,
        uint32 interval,
        uint16 redundancy,
        address node,
        bytes calldata input,
        bytes calldata output,
        bytes calldata proof
    ) internal override {
        emit ComputeReceived(
            subscriptionId,
            interval,
            redundancy,
            node,
            input,
            output,
            proof
        );
    }
}
