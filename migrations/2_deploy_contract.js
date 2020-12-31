var DappToken = artifacts.require("./DStockToken.sol");
var DappTokenSale = artifacts.require("./tokenExchange.sol");

module.exports = function(deployer) {
  deployer.deploy(DDStockToken, 10000).then(function() {
    // Token price is 0.004Ether
    var tokenPrice = 1000000;
    return deployer.deploy(tokenExchange, DStockToken.address, tokenPrice);
  });
};
