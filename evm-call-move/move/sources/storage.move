module storage::storage {
    use std::signer;
    use 0x1::aptos_account;
    use 0x1::account;

    struct StoreU64 has key, store {
        data: u64,
    }

    public entry fun init(account: &signer) {
        let addr = signer::address_of(account);
        if (!account::exists_at(addr)) {
            aptos_account::create_account(addr);
        };
        if (!exists<StoreU64>(addr)) {
            move_to(account, StoreU64 { data: 9 });
        }
    }

    public entry fun set_u64(account: &signer, new_data: u64) acquires StoreU64 {
        let stored_data = borrow_global_mut<StoreU64>(signer::address_of(account));
        stored_data.data = new_data;
    }
}
