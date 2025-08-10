// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

struct Message {
    string content;
    address sender;
    uint256 timestamp;
}

contract DMessage {
    Message[] public messages;

    event MessageSent(
        string content,
        address indexed sender,
        uint256 timestamp
    );

    function sendMessage(string calldata _content) public {
        Message memory newMessage = Message({
            content: _content,
            sender: msg.sender,
            timestamp: block.timestamp
        });
        messages.push(newMessage);

        emit MessageSent(_content, msg.sender, block.timestamp);
    }
}
