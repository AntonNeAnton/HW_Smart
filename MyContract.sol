// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract MyContract {
struct Product {
uint256 productId;
string productName;
uint256 price;
bool isActive;
}

mapping(uint256 => Product) public products;

event ProductAdded(uint256 productId, string productName, uint256 price, bool isActive);
event ProductRemoved(uint256 productId);

function addProduct(uint256 _productId, string memory _productName, uint256 _price, bool _isActive) public {
Product memory newProduct = Product(_productId, _productName, _price, _isActive);
products[_productId] = newProduct;
emit ProductAdded(_productId, _productName, _price, _isActive);
}

function removeProduct(uint256 _productId) public {
delete products[_productId];
emit ProductRemoved(_productId);
}
}