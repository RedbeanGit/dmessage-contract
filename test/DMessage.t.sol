// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "lib/forge-std/src/Test.sol";
import {DMessage, Message} from "../src/DMessage.sol";

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

    function test_GetMessages() public {
        dMessage.sendMessage("Hello, world!");
        dMessage.sendMessage("Hello, again!");

        Message[] memory messages = dMessage.getMessages(0, 2);
        assertEq(messages.length, 2);
        assertEq(messages[0].content, "Hello, world!");
        assertEq(messages[1].content, "Hello, again!");

        // Test out-of-bounds access
        vm.expectRevert("Invalid range");
        dMessage.getMessages(1, 1);

        vm.expectRevert("End index out of bounds");
        dMessage.getMessages(0, 3);
    }
}
