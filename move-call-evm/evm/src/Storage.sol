// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract StorageContract {
    uint256 public storedData;
    bytes public dataData;
    uint256[] public numbers;
    string public textData;

    struct SampleStruct {
        uint id;
        string name;
    }
    SampleStruct public sample;

    mapping(address => uint256) public balances;
    bool public toggleState;
    address[] public userAddresses;

    function setStoredData(uint256 newData) public {
        storedData = newData;
    }

    function storeNumbers(uint256[] calldata nums) public {
        numbers = nums;
    }

    function storeText(string calldata txt) public {
        textData = txt;
    }

    function storeStruct(uint _id, string calldata _name) public {
        sample = SampleStruct(_id, _name);
    }

    function updateBalance(address user, uint256 amount) public {
        balances[user] = amount;
    }

    function toggleBoolean() public {
        toggleState = !toggleState;
    }

    function addAddress(address user) public {
        userAddresses.push(user);
    }
}
