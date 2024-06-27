// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";

import {TraceAttack} from "src/TraceAttack.sol";

contract TraceAttackDeployScript is Script {
    function setUp() public {}

    function run() public {
        
        vm.broadcast();
        TraceAttack traceAttack = new TraceAttack();
        console.log("deployed to", address(traceAttack));
        console.log("testNumber", traceAttack.testNumber());


        vm.broadcast();
        traceAttack.attackSim{value: 0.000001337 ether}();
        console.log("Attack ran");        
        console.log("testNumber", traceAttack.testNumber());
        console.log("contract balance", payable(address(traceAttack)).balance);
    }
}
