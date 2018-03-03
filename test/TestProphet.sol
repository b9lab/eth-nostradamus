pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Nostradamus.sol";
import "../contracts/Prophet.sol";

contract TestProphet {

    function testCanProphecise() public {
        Nostradamus nostra = new Nostradamus();
        Prophet prophet = new Prophet();
        Assert.isFalse(nostra.prophets(prophet), "should start not prophet");
        prophet.propheciseWith(nostra);
        Assert.isTrue(nostra.prophets(prophet), "should end up as prophet");
    }

}
