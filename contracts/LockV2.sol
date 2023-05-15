// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract LockV2 is UUPSUpgradeable, OwnableUpgradeable {
    struct S {
        uint64 a;
        /// @custom:oz-retyped-from uint8
        bool bFails; // <--- Type cannot be changed
        /// @custom:oz-renamed-from cRenameFails
        uint8 cChangedName; // <--- Variable cannot be renamed
    }

    S s;
    /// @custom:oz-retyped-from uint8
    bool bWorks;

    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyOwner {}
}
