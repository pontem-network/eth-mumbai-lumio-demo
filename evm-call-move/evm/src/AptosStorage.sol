// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface ICallMove {
    function call(
         bytes calldata _moduleAddress,
         bytes calldata _moduleId,
         bytes calldata _functionId,
         bytes calldata _callData,
         bytes calldata _generics
    ) external;
}

contract AptosStorage {
    ICallMove move = ICallMove(0x42000000000000000000000000000000000000fF);
    bytes moduleAddress;

    constructor(bytes memory _moduleAddress) {
        moduleAddress = _moduleAddress;
        init();
    }

    function _call(string memory functionId, bytes memory callData) internal {
        move.call(moduleAddress, bytes("storage"), bytes(functionId), callData, new bytes(0));
    }

    function init() internal {
        _call("init", new bytes(0));
    }

    function set_u64(uint64 num) public {
        _call("set_u64", abi.encode(num));
    }
}
