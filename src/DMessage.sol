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

    function getMessages(
        uint256 _start,
        uint256 _end
    ) public view returns (Message[] memory) {
        require(_start < _end, "Invalid range");
        require(_end <= messages.length, "End index out of bounds");

        Message[] memory result = new Message[](_end - _start);
        for (uint256 i = _start; i < _end; i++) {
            result[i - _start] = messages[i];
        }
        return result;
    }
}
