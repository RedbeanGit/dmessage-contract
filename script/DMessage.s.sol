// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {DMessage} from "../src/DMessage.sol";

contract DMessageScript is Script {
    DMessage public dMessage;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        dMessage = new DMessage();

        vm.stopBroadcast();
    }
}
