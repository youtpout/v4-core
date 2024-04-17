// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {LiquidityMath} from "../libraries/LiquidityMath.sol";

contract LiquidityMathTest {
    function addDelta(uint128 x, int128 y) external pure returns (uint128 z) {
        return LiquidityMath.addDelta(x, y);
    }
}
