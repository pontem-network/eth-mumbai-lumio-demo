module call_evm::call_evm {
    use aptos_framework::evm;

    struct SetStoredData has drop {
        a: u256,
    }

    public entry fun set_stored_data(
        acc: &signer,
        a: u256,
        evm_contract_addr: vector<u8>
    ) {
        let c = SetStoredData { a };
        let abi = b"setStoredData(uint256)";

        evm::call(acc, evm_contract_addr, abi, &c);
    }

    struct UpdateBalance has drop {
        user: address,
        amount: u256,
    }

    public entry fun update_balance(
        acc: &signer,
        evm_contract_addr: vector<u8>,
        amount: u256,
    ) {
        let c = UpdateBalance { user: @aptos_framework, amount };
        let abi = b"updateBalance(address,uint256)";
        evm::call(acc, evm_contract_addr, abi, &c);
    }

    struct ToggleBoolean has drop {}

    public entry fun toggle_boolean(acc: &signer, evm_contract_addr: vector<u8>) {
        let c = ToggleBoolean {};
        let abi = b"toggleBoolean()";
        evm::call(acc, evm_contract_addr, abi, &c);
    }

    struct AddAddress has drop {
        user: address,
    }

    public entry fun add_address(
        acc: &signer,
        evm_contract_addr: vector<u8>,
        user: address,
    ) {
        let c = AddAddress { user };
        let abi = b"addAddress(address)";
        evm::call(acc, evm_contract_addr, abi, &c);
    }

    struct StoreNumbers has drop {
        nums: vector<u256>,
    }

    public entry fun store_numbers_hardcoded(acc: &signer, evm_contract_addr: vector<u8>) {
        let c = StoreNumbers { nums: vector[1u256, 2, 3, 4, 5] };
        let abi = b"storeNumbers(uint256[])";
        evm::call(acc, evm_contract_addr, abi, &c);
    }

    struct StoreText has drop {
        txt: vector<u8>,
    }

    public entry fun store_text(
        acc: &signer,
        evm_contract_addr: vector<u8>,
        txt: vector<u8>
    ) {
        let c = StoreText { txt };
        let abi = b"storeText(string)";
        evm::call(acc, evm_contract_addr, abi, &c);
    }

    struct StoreStruct has drop {
        id: u64,
        name: vector<u8>,
    }

    public entry fun store_struct_hardcoded(acc: &signer, evm_contract_addr: vector<u8>) {
        let c = StoreStruct { id: 1, name: b"Sample Name" };
        let abi = b"storeStruct(uint,string)";
        evm::call(acc, evm_contract_addr, abi, &c);
    }
}
