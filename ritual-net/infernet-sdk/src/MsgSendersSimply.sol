/**
 *Submitted for verification at Etherscan.io on 2024-02-08
 */

// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.13;

contract MsgSendersSimply {
    uint256 public messageCount = 0;

    event MessageReceived(bytes input, uint256 count);

    function msgSender(bytes memory input) public {
        messageCount++;
        emit MessageReceived(input, messageCount);
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

    function receiveCompute(
        uint32 subscriptionId,
        uint32 interval,
        uint16 redundancy,
        address node,
        bytes calldata input,
        bytes calldata output,
        bytes calldata proof
    ) public {
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
