// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {
struct CustomStruct {
    uint256 number;
    address owner;
    string description;
    bool isActive;
}

mapping(uint256 => CustomStruct) customStructs;

event StructAdded(uint256 key, uint256 number, address owner, string description, bool isActive);
event StructRemoved(uint256 key);

function addCustomStruct(uint256 key, uint256 _number, address _owner, string memory _description, bool _isActive) public {
    CustomStruct memory newStruct = CustomStruct(_number, _owner, _description, _isActive);
    customStructs[key] = newStruct;
    emit StructAdded(key, _number, _owner, _description, _isActive);
}

function removeCustomStruct(uint256 key) public {
    delete customStructs[key];
    emit StructRemoved(key);
}
}
