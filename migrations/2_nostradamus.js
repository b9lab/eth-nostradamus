const Nostradamus = artifacts.require("./Nostradamus.sol");

module.exports = function(deployer) {
    deployer.deploy(Nostradamus);
};
