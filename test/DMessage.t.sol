// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "lib/forge-std/src/Test.sol";
import {DMessage} from "../src/DMessage.sol";

contract DMessageTest is Test {
    DMessage public dMessage;

    function setUp() public {
        dMessage = new DMessage();
    }

    function test_SendMessage() public {
        dMessage.sendMessage("Hello, world!");

        (string memory content, address sender, uint256 timestamp) = dMessage
            .messages(0);

        assertEq(content, "Hello, world!");
        assertEq(sender, address(this));
        assertEq(timestamp, block.timestamp);
    }
}
