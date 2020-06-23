pragma solidity 0.5.16;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Nostradamus.sol";

contract TestNostradamus {

    function testCanProphecise() public {
        Nostradamus nostra = new Nostradamus();
        Assert.isFalse(nostra.prophets(address(this)), "should start not prophet");
        uint blockNumber = block.number;
        bytes32 blockHash = blockhash(blockNumber);
        bytes32 theWord = keccak256(abi.encodePacked(this, blockNumber, blockHash, block.timestamp, nostra));
        nostra.prophecise(theWord, "made it");
        Assert.isTrue(nostra.prophets(address(this)), "should end up as prophet");
    }

    function testCanPropheciseWithCall() public {
        Nostradamus nostra = new Nostradamus();
        Assert.isFalse(nostra.prophets(address(this)), "should start not prophet");
        uint blockNumber = block.number;
        bytes32 blockHash = blockhash(blockNumber);
        bytes32 theWord = keccak256(abi.encodePacked(this, blockNumber, blockHash, block.timestamp, nostra));
        bool callResult = propheciseAsCall(nostra, theWord, "made it");
        Assert.isTrue(callResult, "should have accepted");
        Assert.isTrue(nostra.prophets(address(this)), "should end up as prophet");
    }

    function testTheWordDoesNotLetProphecise() public {
        Nostradamus nostra = new Nostradamus();
        Assert.isFalse(nostra.prophets(address(this)), "should start not prophet");
        bytes32 theWord = nostra.theWord();
        bool callResult = propheciseAsCall(nostra, theWord, "made it");
        Assert.isFalse(callResult, "should not have accepted");
        Assert.isFalse(nostra.prophets(address(this)), "should still not be a prophet");
    }

    function propheciseAsCall(Nostradamus nostra, bytes32 theWord, bytes32 braggingRights) private returns(bool success) {
        (success,) = address(nostra).call(abi.encodeWithSelector(
            bytes4(keccak256("prophecise(bytes32,bytes32)")),
            theWord,
            braggingRights));
    }

}
