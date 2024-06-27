// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

contract TraceAttack {
    uint256 public testNumber = 42;

    function attackSim() external payable {
        (bool success, ) = address(this).call(abi.encodeWithSignature("innerAttackSim()"));
        require(success == false, "innerAttack should revert");
    }

    function innerAttackSim() external {
        // Because we revert, this trasfer be as if it never happened
        address CERTIK = 0x5a7732d8710Af819dd16c82D38ED4385e137285C;
        payable(CERTIK).transfer(address(this).balance);
        
        // Because we revert, testNumber will be unchanged
        testNumber = 0xbad;

        // Revert
        require(false, "Nope");
    }
}
