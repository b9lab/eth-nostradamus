pragma solidity ^0.4.18;

import "./Nostradamus.sol";

contract Prophet {
	function propheciseWith(Nostradamus nostra) public {
		uint blockNumber = block.number;
        bytes32 blockHash = block.blockhash(blockNumber);
        nostra.prophecise(keccak256(this, blockNumber, blockHash, block.timestamp, nostra));
        assert(nostra.prophets(this));
	}
}