// getting funds 
// withdraw funds by the owner of the contract
// set min funding value

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    // function marked payable can receive Ether via msg.value.

    function receiveFunds() public payable {

        // value of a transaction is accessible through the msg.value property
        // This property is part of the global object msg
        // It represents the amount of Wei transferred in the current transaction, where Wei is the smallest unit of Ether (ETH).
        // 1 ETH = 1e18 WEI = 1e9 GWEI

        require(msg.value >= 1e18, "minimum allowed funds are 1ETH");

        //If the specified requirement is not met, the transaction will revert.
    }

    function getVersion() public view returns (uint256) {
        // getting realtime price data from chainlink
        // added a ton of files because of import, not adding to git
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }
}