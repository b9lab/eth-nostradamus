const Nostradamus = artifacts.require("./Nostradamus.sol");

contract("Nostradamus", function(accounts) {

    it("should have deployed an instance", function() {
        return Nostradamus.deployed()
            .then(deployed => web3.eth.getCode(deployed.address))
            .then(code => assert.isAtLeast(code.length, 10));
    });

    it("should not be initial prophet", function() {
        return Nostradamus.deployed()
            .then(deployed => deployed.prophets(accounts[0]))
            .then(isProphet => assert.isFalse(isProphet));
    });

});
