// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Lock is UUPSUpgradeable, OwnableUpgradeable {
    struct S {
        uint64 a;
        uint8 bFails; // <--- Type cannot be changed
        uint8 cRenameFails; // <--- Variable cannot be renamed
    }

    S s;
    uint8 bWorks; // This type can be renamed

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyOwner {}
}
