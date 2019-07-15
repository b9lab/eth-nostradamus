const Nostradamus = artifacts.require("./Nostradamus.sol");

contract("Nostradamus", function(accounts) {

    it("should have deployed an instance", async function() {
        const deployed = await Nostradamus.deployed();
        const code = await web3.eth.getCode(deployed.address);
        assert.isAtLeast(code.length, 10);
    });

    it("should not be initial prophet", async function() {
        const deployed = await Nostradamus.deployed();
        const isProphet = await deployed.prophets(accounts[0]);
        assert.isFalse(isProphet);
    });

});
