// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.19;

import {IHooks} from "../interfaces/IHooks.sol";

/// @notice This is a temporary library that allows us to use transient storage (tstore/tload), no-cancun remove that
/// TODO: This library can be deleted when we have the transient keyword support in solidity.
library Lock {
<<<<<<< HEAD
    // The slot holding the lock, transiently
    uint256 constant LOCK_SLOT = uint256(keccak256("Lock")) - 1;

    function lock() internal {
        uint256 slot = LOCK_SLOT;
        assembly {
            // set the lock
            sstore(slot, true)
        }
    }
=======
    // The slot holding the unlocked state, transiently. uint256(keccak256("Unlocked")) - 1;
    uint256 constant IS_UNLOCKED_SLOT = uint256(0xc090fc4683624cfc3884e9d8de5eca132f2d0ec062aff75d43c0465d5ceeab23);
>>>>>>> 9759195106902550169588b4fb5f546dcd35fe08

    function unlock() internal {
        uint256 slot = IS_UNLOCKED_SLOT;
        assembly {
<<<<<<< HEAD
            sstore(slot, false)
=======
            // unlock
            sstore(slot, true)
>>>>>>> 9759195106902550169588b4fb5f546dcd35fe08
        }
    }

    function lock() internal {
        uint256 slot = IS_UNLOCKED_SLOT;
        assembly {
<<<<<<< HEAD
            locked := sload(slot)
=======
            sstore(slot, false)
        }
    }

    function isUnlocked() internal view returns (bool unlocked) {
        uint256 slot = IS_UNLOCKED_SLOT;
        assembly {
            unlocked := sload(slot)
>>>>>>> 9759195106902550169588b4fb5f546dcd35fe08
        }
    }
}
