pragma solidity 0.5.16;

import "./Nostradamus.sol";

contract Prophet {
    function propheciseWith(Nostradamus nostra, bytes32 braggingRights) public {
        uint blockNumber = block.number;
        bytes32 blockHash = blockhash(blockNumber);
        nostra.prophecise(keccak256(abi.encodePacked(this, blockNumber, blockHash, block.timestamp, nostra)), braggingRights);
        assert(nostra.prophets(address(this)));
    }
}
