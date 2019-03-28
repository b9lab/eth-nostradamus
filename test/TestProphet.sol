pragma solidity 0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Nostradamus.sol";
import "../contracts/Prophet.sol";

contract TestProphet {

    function testCanProphecise() public {
        Nostradamus nostra = new Nostradamus();
        Prophet prophet = new Prophet();
        Assert.isFalse(nostra.prophets(address(prophet)), "should start not prophet");
        prophet.propheciseWith(nostra, "made it");
        Assert.isTrue(nostra.prophets(address(prophet)), "should end up as prophet");
    }

}
