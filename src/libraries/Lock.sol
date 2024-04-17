// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.19;

import {IHooks} from "../interfaces/IHooks.sol";

/// @notice This is a temporary library that allows us to use transient storage (tstore/tload), no-cancun remove that
/// TODO: This library can be deleted when we have the transient keyword support in solidity.
library Lock {
    // The slot holding the lock, transiently
    uint256 constant LOCK_SLOT = uint256(keccak256("Lock")) - 1;

    function lock() internal {
        uint256 slot = LOCK_SLOT;
        assembly {
            // set the lock
            sstore(slot, true)
        }
    }

    function unlock() internal {
        uint256 slot = LOCK_SLOT;
        assembly {
            sstore(slot, false)
        }
    }

    function isLocked() internal view returns (bool locked) {
        uint256 slot = LOCK_SLOT;
        assembly {
            locked := sload(slot)
        }
    }
}
