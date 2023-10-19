# Damn Vulnerable DeFi V3 Solutions by JohnnyTime

Solutions to [Damn Vulnerable DeFi V3](https://www.damnvulnerabledefi.xyz/) CTF challenges ⛳️ 

Original repository (without solutions): [Damn Vulnerable DeFi V3 Github](https://github.com/tinchoabbate/damn-vulnerable-defi/tree/v3.0.0)

## Contents

- [Damn Vulnerable DeFi V3 Solutions by JohnnyTime](#damn-vulnerable-defi-v3-solutions-by-johnnytime)
  - [Contents](#contents)
  - [0.1 - What's New In Damn Vulnerable DeFi V3](#01---whats-new-in-damn-vulnerable-defi-v3)
    - [New Challenges and ERC Implementations](#new-challenges-and-erc-implementations)
    - [Enhanced Libraries: Solmate and Solady](#enhanced-libraries-solmate-and-solady)
    - [Refactoring and Complexity](#refactoring-and-complexity)
  - [0.2 - Tips to Get Started](#02---tips-to-get-started)
    - [Getting Started](#getting-started)
    - [Exploring the Repository](#exploring-the-repository)
    - [Tips for Success](#tips-for-success)
    - [Comprehensive Course Option](#comprehensive-course-option)
  - [1 - Unstoppable](#1---unstoppable)
  - [2 - Naive receiver](#2---naive-receiver)
    - [Option 1: Solve with 10 Transactions](#option-1-solve-with-10-transactions)
    - [Option 2: Solve with Only 1 Transaction](#option-2-solve-with-only-1-transaction)
  - [3 - Truster](#3---truster)
  - [4 - Side Entrance](#4---side-entrance)
  - [5 - The Rewarder](#5---the-rewarder)
  - [6 - Selfie](#6---selfie)
  - [7 - Compromised](#7---compromised)
    - [Smart Contracts](#smart-contracts)
    - [The Vulnerability](#the-vulnerability)
    - [The Exploit](#the-exploit)
  - [8 - Puppet](#8---puppet)
  - [9 - Puppet V2](#9---puppet-v2)
  - [10 - Free rider](#10---free-rider)
  - [11 - Backdoor](#11---backdoor)
    - [`WalletRegistery.sol` Breakdown](#walletregisterysol-breakdown)
    - [Attack Plan](#attack-plan)
    - [Executing the Attack](#executing-the-attack)
  - [12 - Climber](#12---climber)
  - [13 - Wallet Mining](#13---wallet-mining)
  - [14 - Puppet V3](#14---puppet-v3)
  - [15 - ABI Smuggling](#15---abi-smuggling)

## 0.1 - What's New In Damn Vulnerable DeFi V3
Damn Vulnerable DeFi Version 3 (DVD V3) is an educational tool for newbie Web3 hackers to practice hacking real smart contracts in DeFi protocols. It brings fresh challenges, new features, and more complexity to improve learning.

Let's see what's new in DVD V3 and what it offers to web3 security researchers:

### New Challenges and ERC Implementations
DVD V3 introduces three new challenges: [Puppet v3](https://www.damnvulnerabledefi.xyz/challenges/puppet-v3/), [ABI Smuggling](https://www.damnvulnerabledefi.xyz/challenges/abi-smuggling/), and [Wallet Mining](https://www.damnvulnerabledefi.xyz/challenges/wallet-mining/). It also includes [ERC4626](https://ethereum.org/en/developers/docs/standards/tokens/erc-4626/), [ERC3156](https://eips.ethereum.org/EIPS/eip-3156), and [ERC2612](https://eips.ethereum.org/EIPS/eip-2612), expanding the options to explore tokenized vaults, flash loans, and permit functions.

### Enhanced Libraries: Solmate and Solady
Unlike DVD V2, which only used [OpenZeppelin Contracts](https://www.openzeppelin.com/contracts), DVD V3 now has libraries like [Solmate](https://github.com/transmissions11/solmate) and [Solady](https://github.com/Vectorized/solady). This adds variety to the challenges, exposing users to more popular libraries used in mainstream DeFi.

### Refactoring and Complexity
All existing challenges in DVD V3 have been improved, with updates to both Solidity and JavaScript code. This might affect previous solutions, as things like interfaces and complexities have changed. The new version also includes ERC implementations, gas optimizations, and assembly, reflecting real DeFi contract evolution.

[Checkout The Full Article](https://medium.com/@JohnnyTime/damn-vulnerable-defi-version-3-whats-new-87d7e7eaf0f1)

[![Watch The Full Video](https://i.imgur.com/MmnxrGB.jpg)](https://www.youtube.com/watch?v=CfR1CcO8lEI)

## 0.2 - Tips to Get Started
DVD V3 introduces 15 exercises, each representing a unique vulnerable smart contract. These exercises span various attack vectors, including flash loans, governance attacks, NFTs, DEXs, and lending protocols.

### Getting Started
To begin with DVD V3, clone the [challenge's repository](https://github.com/tinchoabbate/damn-vulnerable-defi/tree/v3.0.0) (without solutions) and set up the environment. 
The challenge uses the [Hardhat framework](https://hardhat.org/), written in [Solidity](https://docs.soliditylang.org/en/v0.8.21/) for smart contracts and JavaScript for test files.

Clone the repository: `git clone https://github.com/tinchoabbate/damn-vulnerable-defi/tree/v3.0.0`
Navigate to the directory: `cd damn-vulnerable-defi`
Install dependencies: `yarn install`

### Exploring the Repository
DVD V3's repository is structured around [contracts](./contracts/) and [test](./test/) folders. Each exercise has its own folder containing vulnerable smart contracts and corresponding test files. The [player contracts](./contracts/player-contracts/) folder allows users to deploy their malicious contracts for interaction.

### Tips for Success

Succeeding in DVD V3 2023 requires strategic thinking and keen observation. Here are tips to boost your success:

- **Careful Reading:** Thoroughly understand exercise instructions, objectives, and hints.
- **Smart Contract Analysis:** Dive into smart contract code, identifying potential security issues.
- **Special Comments:** Use comments to mark vulnerabilities or exploit ideas within contracts, you can use the [Solidity Visual Developer VSCode Plugin](https://marketplace.visualstudio.com/items?itemName=tintinweb.solidity-visual-auditor), check out the full [video tutorial](https://www.youtube.com/watch?v=Bpt2Yn9AlIU).
- **Test File Exploration:** Explore test files to understand the system state and transaction sequence.
- **Persistence and Experimentation:** Overcome challenges with experimentation and perseverance.
- **Take Breaks:** Refresh your mind by taking breaks during complex challenges.
- **Watch Walkthroughs:** Seek guidance from walkthrough videos for new perspectives.

### Comprehensive Course Option
In case you feel like you lack some fundamentals in smart contract hacking, it's highly recommended to take a comprehensive and structured approach that will help you in your auditing career.
You can enroll in [The Smart Contract Hacking Course](https://smartcontractshacking.com/) - which includes over 30 videos and 40+ exercises, including walkthroughs. The course offers community interaction and an official Smart Contract Hacker Certificate upon completion.

[Checkout The Full Article](https://medium.com/@JohnnyTime/getting-started-with-damn-vulnerable-defi-v3-2023-a-comprehensive-guide-34599983ee1b)

[![Watch The Full Video](https://i.imgur.com/3knz9eX.jpg)](https://www.youtube.com/watch?v=ssqjWX96Smc)

## 1 - Unstoppable

The goal of the first challenge is to perform a DOS (Denial of Service) attack to the pool contract.

A vulnerability arises within the flashLoan function, where the following code snippet is problematic:

```solidity
uint256 balanceBefore = totalAssets();
if (convertToShares(totalSupply) != balanceBefore) revert InvalidBalance();
```

This code uses the [ERC4626 standard](https://ethereum.org/en/developers/docs/standards/tokens/erc-4626/), which outlines functionalities for tokenized vaults, typically employed to track user deposit shares within the vault. 

This mechanism helps with calculating rewards for users who stake tokens within the vault. In this scenario, `DVT` represents the underlying token, while `oDVT` is the deployed vault token.

Under the ERC4626 guidelines, the `convertToShares()` function transforms an asset amount (`DVT`) into the corresponding share quantity (`oDVT`) the vault should mint, based on the ratio of user-deposited assets. Notably, two critical issues emerge:


1. The `totalAssets` function has been modified to return the vault contract's asset balance `(asset.balanceOf(address(this)))`. This represents a different accounting system that tracks the vault token supply.

2. The condition `(convertToShares(totalSupply) != balanceBefore)` enforces the equivalence of `totalSupply` of vault tokens and `totalAsset` of underlying tokens before executing any flash loan. This could potentially render the `flashLoan` function inactive if we can make this condition fail.

The attack involves introducing a conflict between the two accounting systems through a manual transfer of `DVT` tokens to the vault.


[Solution Test File](./test/unstoppable/unstoppable.challenge.js)

[Unstoppable Solution Tutorial (Full Article)](https://medium.com/p/1fe4364165cd)

[![Unstoppable Solution - Walkthrough Video](https://i.imgur.com/kpgRtUq.jpg)](https://www.youtube.com/watch?v=SssTj52WYNM&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00=)

## 2 - Naive receiver
The challenge is simple: we gotta empty the FlashLoanReceiver contract of all its ETH. Let's see how it's done!

We got two smart contracts:
- `NaiveReceiverLenderPool.sol`: Provides flash loans at a 1 ETH fixed fee.
- `FlashLoanReceiver.sol`: The contract that gets the flash loan and needs to repay it + the 1 ETH fee.

So what's the vulnerability?

FlashLoanReceiver disregards the first parameter in its `onFlashLoan` function, letting ANYONE initiate flash loans.
This becomes an Access Control issue, allowing us to use it to execute multiple flash loans.

### Option 1: Solve with 10 Transactions

Initiate 10 flash loans on behalf of FlashLoanReceiver, each taking 1 ETH fee.
Use the provided code in `naive-receiver.challenge.js`:

```javascript
const ETH = await pool.ETH();
for(let i = 0; i < 10; i++){
    await pool.connect(player).flashLoan(receiver.address, ETH, 0, "0x");
}
```

### Option 2: Solve with Only 1 Transaction

Deploy a malicious contract, `AttackNaiveReceiver.sol`, that requests 10 flash loans on behalf of FlashLoanReceiver.

Here is the malicious smart contract code:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface IPool{
     function flashLoan(address receiver, address token, uint256 amount, bytes calldata data) external returns (bool);
}

contract AttackNaiveReceiver {

    address private constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    constructor(address _pool, address _victim) {

        for(uint256 i=0; i < 10; i++){
            IPool(_pool).flashLoan(_victim, ETH, 0, "0x");
        }
    }

}

```

And here's the code for `naive-receiver.challenge.js`:

```javascript
const AttackerContractFactory = await ethers.getContractFactory('AttackNaiveReceiver', player);
await AttackerContractFactory.deploy(pool.address, receiver.address);
```

[Solution - AttackNaiveReceiver.sol Contract](./contracts/player-contracts/AttackNaiveReceiver.sol)

[Solution - Test File](./test/naive-receiver/naive-receiver.challenge.js)

[Naive Receiver Solution Tutorial (Full Article)](https://medium.com/p/73a06de164ef)

[![Naive Receiver Solution - Walkthrough Video](https://i.imgur.com/FhJsAVK.jpg)](https://www.youtube.com/watch?v=2tFlcH5k-jk&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00=)


## 3 - Truster
The goal in this challenge is to steal 1 million DVT tokens from a lending pool. 

The challenge centers around a vulnerable smart contract called TrusterLenderPool. 
This contract allows flash loans, where users can temporarily borrow tokens and interact with another contract.

The vulnerability lies in the `flashLoan` function, which lets anyone trigger various contract calls through the pool contract. However, this could be risky as the caller's context (msg.sender) is the pool contract. The aim is to exploit this vulnerability to gain access to the tokens.

The technique involves leaving a "backdoor" exploiting a feature in the ERC20 fungible token standard.

By using the `approve` function, the pool contract grants permission to another address to spend its tokens. This approval allows the address to use the `transferFrom` function to acquire tokens. The plan is to have the pool contract approve the exploiter's address, then later use the transferFrom function to take the tokens.

The challenge can be solved by adding the following code to the `truster.challenge.js` file (Execution section):

```javascript
let interface = new ethers.utils.Interface(["function approve(address spender, uint256 amount)"])
let data = interface.encodeFunctionData("approve", [player.address, TOKENS_IN_POOL]);

await pool.connect(player).flashLoan(0, player.address, token.address, data);
await token.connect(player).transferFrom(pool.address, player.address, TOKENS_IN_POOL)
```

The provided code prepares information for the "approve" function call. It includes the exploiter's address and the number of tokens in the pool. A flash loan is triggered with a request for 0 tokens, focusing on executing the approval function. Once approved, the transferFrom function is used to grab all approved tokens.

The challenge is completed and the tokens are acquired! :)

[Solution - Test File](./test/truster/truster.challenge.js)

[Truster Solution Tutorial (Full Article)](https://medium.com/p/cac8adf55233)

[![Truster Solution - Walkthrough Video](https://i.imgur.com/afEnVwL.jpg)](https://www.youtube.com/watch?v=CMRaTqjLUfc&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00=)

## 4 - Side Entrance
- The challenge starts with a flash loan pool that has 1000 ETH in balance.
- It allows users to deposit and withdraw ETH
- We need to drain the pool

Similar to the previous challenge, we are going to leave a backdoor and claim our ETH later.
We will exploit the 3 functions `flashLoan`, `deposit` and `withdraw`

1. We request a `flashLoan`
2. During the flashloan we deposit the borrowed assets back to the pool. The flashLoan will succeed since the balance of the pool didn't change, but the contract will credit our mapping balance.
3. After the `flashLoan` is completed and the contract credited us, we call the withdraw function to drain all the ETH that we "deposited" earlier (even though it wasn't our ETH but we borrowed ETH)

The challenge is completed and we were able to drain all the ETH from the pool!! :)

[Solution - AttackSideEntrance.sol Contract](./contracts/player-contracts/AttackSideEntrance.sol)

[Solution - Test File](./test/side-entrance/side-entrance.challenge.js)

[Side Entrance Solution Tutorial (Full Article)](https://medium.com/p/b5ccbd64e1e7)

[![Side Entrance Solution - Walkthrough Video](https://i.imgur.com/OwtLxeN.jpg)](https://youtu.be/upUsq4eJ2-E&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00=)


## 5 - The Rewarder
In this challenge, there's a pool that offers rewards in tokens every 5 days for depositing DVT tokens. We don't have any DVT tokens 😭 We've heard rumors about flash loans in DVT tokens, hinting that we can use them to claim rewards.

To tackle this challenge, we need to understand four main contracts:
1. `RewardToken.sol` - The reward token
2. `AccountingToken.sol` - ERC20 Snapshot used for accounting
3. `FlashLoanerPool.sol` - Provides DVT Flash Loans
4. `TheRewarderPool.sol` - Stake DVT ➡️ Get Reward Token

The contracts have multiple vulnerabilities, including not considering the time users have staked and allowing reward manipulation for super high stakes created using a flashLoan. We'll use a `flashLoan` to stake, earn rewards, and withdraw tokens (to pay back the flash loan ;)

Our malicious contract will:
1. Initiate a flash loan for DVT tokens
2. Deposit tokens into the Rewarder Pool
3. Distribute rewards 4. Withdraw rewards and send them back to the Flash Loaner Pool This sequence allows us to claim rewards without having any tokens initially

Let's put it to the test! We'll fast-forward time, deploy our malicious contract, and initiate the attack. 

[Solution - AttackTheRewarder.sol Contract](./contracts/player-contracts/AttackTheRewarder.sol)

[Solution - Test File](./test/the-rewarder/the-rewarder.challenge.js)

[The Rewarder Solution Tutorial (Full Article)](https://medium.com/p/d3bac0f4ca2f)

[![The Rewarder Solution - Walkthrough Video](https://i.imgur.com/03xVDLE.jpg)](https://www.youtube.com/watch?v=zT5uNbGPaJ4&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00=)

## 6 - Selfie

The challenge involves a pool allowing flash loans of DVT tokens, governed by a governance mechanism
Our mission: Acquire all 1.5 million DVT tokens from the pool
To succeed, we must understand the contracts: SelfiePool.sol and SimpleGovernance.sol

SimpleGovernance.sol: The heart of governance, allowing users to propose and queue actions for execution.
Conditions include votes from token holders (at least 50% of the supply) and a 2-day time delay.

SelfiePool.sol: The flash loan provider with a safety mechanism (`emergencyExit` function).
Governance can drain funds in emergencies, but only the governance contract can trigger it.

We've noticed that the governance mechanism allows the execution of actions, including the `emergencyExit` function in the pool contract.
However, there's a catch: only the governance contract itself can trigger this function.

To achieve our goal, we need to create an action in the governance that allows us to execute the `emergencyExit` function with our parameters. 
But there's a challenge: we need at least 50% of the DVT token supply to queue this action, which we don't have.

Here's where it gets exciting! We utilize the flash loan function in the `SelfiePool.sol` contract to borrow a significant amount of DVT tokens without collateral.
This becomes our entry point for the exploit.

We've created a malicious smart contract, `AttackSelfie.sol`, that implements our exploit strategy:
1. Flash Loan 1.5 million DVT tokens from the pool
2. Queue a new malicious action for `emergencyExit`
3. Pay back the loan

Now we will add our malicious Javascript code to the "Execution" section, to deploy our contract, initiate the exploit, fast-forward 2 days, and execute the proposal.

Then we will run `yarn selfie` to test our exploit... and... It worked!


[Solution - AttackSelfie.sol Contract](./contracts/player-contracts/AttackSelfie.sol)

[Solution - Test File](./test/selfie/selfie.challenge.js)

[Selfie Solution Tutorial (Full Article)](https://medium.com/p/2dd62fe89dd7)

[![Selfie Solution - Walkthrough Video](https://i.imgur.com/tX966kb.jpg)](https://www.youtube.com/watch?v=_2RHyMMLR9A&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00)

## 7 - Compromised
The 7th Challenge, "Compromised," involves an NFT exchange with high-priced NFTs sourced from an external Oracle Service.
The goal is to manipulate the exchange's prices to buy low and sell high, draining the exchange's ETH.

### Smart Contracts
- `Exchange.sol`: Represents the NFT exchange, allows buying and selling of `DVNF` tokens.
- `TrustfulOracle.sol`: A decentralized price oracle with trusted sources for calculating median prices.
- `TrustfulOracleInitializer.sol`: A utility contract to deploy and initialize a new instance of the TrustfulOracle contract.

### The Vulnerability
- Private keys associated with trusted oracle accounts are leaked.
- These keys can be used to manipulate prices within the oracle, enabling profitable transactions.

Leaked message from the web service:
`4d 48 68 6a 4e 6a 63 34 5a 57 59 78 59 57 45 30 4e 54 5a 6b 59 54 59 31 59 7a 5a 6d 59 7a 55 34 4e 6a 46 6b 4e 44 51 34 4f 54 4a 6a 5a 47 5a 68 59 7a 42 6a 4e 6d 4d 34 59 7a 49 31 4e 6a 42 69 5a 6a 42 6a 4f 57 5a 69 59 32 52 68 5a 54 4a 6d 4e 44 63 7a 4e 57 45 35

4d 48 67 79 4d 44 67 79 4e 44 4a 6a 4e 44 42 68 59 32 52 6d 59 54 6c 6c 5a 44 67 34 4f 57 55 32 4f 44 56 6a 4d 6a 4d 31 4e 44 64 68 59 32 4a 6c 5a 44 6c 69 5a 57 5a 6a 4e 6a 41 7a 4e 7a 46 6c 4f 54 67 33 4e 57 5a 69 59 32 51 33 4d 7a 59 7a 4e 44 42 69 59 6a 51 34`

Let's convert the hex into utf-8 text, we get these:
`MHhjNjc4ZWYxYWE0NTZkYTY1YzZmYzU4NjFkNDQ4OTJjZGZhYzBjNmM4YzI1NjBiZjBjOWZiY2RhZTJmNDczNWE5
MHgyMDgyNDJjNDBhY2RmYTllZDg4OWU2ODVjMjM1NDdhY2JlZDliZWZjNjAzNzFlOTg3NWZiY2Q3MzYzNDBiYjQ4`

This looks like a base64 encoding. If we decode it from base64 into utf-8 text, we get these:
`0xc678ef1aa456da65c6fc5861d44892cdfac0c6c8c2560bf0c9fbcdae2f4735a9
0x208242c40acdfa9ed889e685c23547acbed9befc60371e9875fbcd736340bb48`

These looks like 2 private keys! :)

### The Exploit
- Convert leaked private keys from HEX to ASCII to Base64.
- Create wallet objects with these private keys.
- Set a low price for NFTs and buy them at a low price.
- Set a high price for NFTs and sell them back to the exchange, draining its ETH.
- Restore the original price.
- By following these steps, you can successfully complete the Compromised Challenge and drain the exchange of its ETH.


[Solution - Test File](./test/compromised/compromised.challenge.js)

[Compromised Solution Tutorial (Full Article)](https://medium.com/p/ea9b42c23068)

[![Compromised Solution - Walkthrough Video](https://i.imgur.com/BrPxE9e.jpg)](https://www.youtube.com/watch?v=ecYTmC6tUXI&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00)

## 8 - Puppet

The challenge involves manipulating the price Oracle of a lending pool by exploiting a vulnerability in the calculation of the Oracle price. It focuses on the use of a Uniswap V1 exchange as the price Oracle, which has low liquidity.

The primary contract is `PuppetPool.sol`, a lending pool where users can borrow tokens by providing collateral in ETH.
The constructor takes addresses for the DVT token and a Uniswap pair of DVT tokens with ETH.
It calculates required collateral based on the current Oracle price and ensures users provide sufficient collateral before borrowing tokens.

The vulnerability lies in the contract's over-reliance on Uniswap liquidity to determine token prices.
We can manipulate the Uniswap liquidity pool to distort the perceived price of the token.

The exploit involves dumping tokens into the pool, altering price perception, depositing minimal ETH collateral, and then borrowing all the DVT tokens.

We will create a `AttackPuppet.sol` contract, which interacts with Uniswap and the `PuppetPool.sol` contract.
The attack contract will:
1. **Dump DVT Tokens:** The attacker starts by dumping a significant number of DVT tokens into the Uniswap liquidity pool. This sudden influx of tokens into the pool causes the price of DVT to drop significantly.

2. **Altering Price Perception:** With the DVT price significantly lowered due to the increased token supply in the pool, the PuppetPool contract perceives DVT as nearly worthless.

3. **Minimal Collateral:** The attacker then deposits a relatively small amount of ETH as collateral in the PuppetPool. Since the contract believes DVT is nearly worthless (thanks to the manipulated Uniswap price), it doesn't require a significant ETH deposit.

4. **Borrowing Tokens:** With minimal ETH collateral, the attacker is now in a position to borrow or, in essence, steal all the DVT tokens from the PuppetPool. The contract's flawed price perception allows this to happen.

[Solution - AttackPuppet.sol Contract](./contracts/player-contracts/AttackPuppet.sol)

[Solution - Test File](./test/puppet/puppet.challenge.js)

[Puppet Solution Tutorial (Full Article)](https://medium.com/p/49472219b0c8)

[![Puppet Solution - Walkthrough Video](https://i.imgur.com/rq3IPaM.jpg)](https://www.youtube.com/watch?v=7pf3COTx708&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00)

## 9 - Puppet V2

In this challenge we start with 20 ETH and 10,000 DVD tokens while the `PuppetV2Pool.sol` smart contract holds a million DVD tokens. Our goal is to steal all the DVT tokens from the smart contract.

The main contract is `PuppetV2Pool.sol`, which allows borrowing tokens against WETH collateral using Uniswap V2 Pair for price information. It maintains a "deposits" mapping to track user deposits. Users can borrow DVT tokens by depositing three times the value in WETH.

The `calculateDepositOfWETHRequired()` calculates the required WETH collateral in order to borrow a specific amount of DVT tokens.
It uses Uniswap V2 library to get price quotes based on the pair reservers (liquidity).

The vulnerability lies in how the contract fetches DVT token prices from Uniswap V2.
The price calculation is based on the current liquidity of the pair contract, making it susceptible to manipulation through external capital or flash loans, we can't use flashSwap since it uses the reserves state variables and not simply the pair contract token's balance.

In order to exploit the Puppet V2 pool we will create an attack contract that will:
1. Dump 10,000 DVT tokens into the liquidity pool, receiving around 9 ETH.
2. This reduces the DVT price in the pool.
3. Deposit ETH as collateral since DVT price is low.
4. Borrow all 100,000 DVT tokens from the pool.


[Solution - AttackPuppetV2.sol Contract](./contracts/player-contracts/AttackPuppetV2.sol)

[Solution - Test File](./test/puppet-v2/puppet-v2.challenge.js)

[Puppet V2 Solution Tutorial (Full Article)](https://medium.com/p/48cd878f275e)

[![Puppet V2 Solution - Walkthrough Video](https://i.imgur.com/5EjZAzL.jpg)](https://www.youtube.com/watch?v=F4kqItXHDb0&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00)

## 10 - Free rider

In this challenge we need to hack an NFT Marketplace and steal the 6 NFTs that are listed on it.
Once we successfully steal them we should send them to the DEV team to receive a bounty of 45 ETH.

Every NFT is listed for 15 ETH, and we have only 0.1 so we need to find some vulnerabilities in the marketplace in order to get the NFTs "for free".

The marketplace contract which holds the NFTs is `FreeRiderNFTMarketplace.sol`, and the Contract for the recovery of the NFTs and receiving the bounties (that the DEVs setup) is `FreeRiderRecovery.sol`.

There are some vulnerabilities with the marketplace which we can exploit:

1. There is a problem with the `msg.value` validation in the contract. The _buyOne function checks if the user paid enough ETH to purchase the NFT, but there's a logical bug. Buyers can exploit this by using the buyMany function to purchase all NFTs while only paying for one, as `msg.value` remains constant.
   
2. The second issue is that ETH is sent to the NFT buyer instead of the seller. This happens because the NFT is transferred before sending the ETH, resulting in a refund to the buyer. 
   
These 2 vulnerabilities combines allows an attacker to purchase all NFTs for just 15 ETH and receive their ETH back. 

The challenge here is that we initially have only 0.1 ETH, which is far from the required 15 ETH. So, how can we manage to temporarily obtain 15 ETH, even if it's just for a moment?
FlashSwap is the Answer!

- The test file shows the deployment of a Uniswap Pair with 9000 ETH, which is essential for our attack plan!
- The plan involves using this liquidity pool to "borrow" ETH via a FlashSwap, which will be used to acquire NFTs.
- We can repay the borrowed ETH due to a previously identified bug, that the buyer is the one who receives the ETH.

The attack plan consists of several steps:
1. Deploy a malicious contract and allocate ETH to cover Uniswap Pool fees.
2. Borrow 15 ETH from the Uniswap liquidity pool using Uniswap V2 FlashSwaps.
3. Convert the received WETH to usable ETH for NFT purchase.
4. Exploit the first bug in `_buyOne` to buy all NFTs with only 15 ETH.
5. Take advantage of the second bug to obtain both the ETH and NFTs.
6. Repay the borrowed ETH, including a 0.3% fee, to the Uniswap V2 Pool.
7. Send tokens to the "Recovery" contract to claim the bounty.


[Solution - AttackFreeRider.sol Contract](./contracts/player-contracts/AttackFreeRider.sol)

[Solution - Test File](./test/free-rider/free-rider.challenge.js)

[Free Rider Solution Tutorial (Full Article)](https://medium.com/p/7da8122691b3)

[![Free Rider Solution - Walkthrough Video](https://i.imgur.com/Y2hPOwU.jpg)](https://youtu.be/TgtRCjFACDk&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00)

## 11 - Backdoor
In this challenge there is a company that incentivises MultiSig Wallet creation, and offers 10DVT tokens as bounty for every employee that will create a Safe. Our goal is to steal those 40 DVT tokens (10 DVT * 2 beneficiaries), even though we're not in the beneficiaries list.

### `WalletRegistery.sol` Breakdown
- The `WalletRegistry` contract features a callback function called `proxyCreated`.
- This function is triggered when a new wallet is created through the Gnosis wallet factory using `createProxyWithCallback`.
- Multiple checks are in place within the `proxyCreated` function to ensure safe initialization of new wallets.
- If these checks pass, the `WalletRegistry` sends token rewards to the newly deployed safe.

Upon examining the initialization data provided during wallet creation, used to initialize the wallet by invoking the `setup` function in `GnosisSafe.sol`, among all the arguments passed to `setup`, only the following can be customized while still satisfying the registry's validation checks: `address to`, `bytes calldata data`, `paymentToken`, `payment`, and `paymentReceiver`.

### Attack Plan
- During the setup procedure, it's possible to execute code on behalf of the Gnosis Safe itself.
- This opens an opportunity to utilize the "Modules" feature, allowing for the creation of a malicious contract and executing code on behalf of the newly created safe.
- The plan is to create a sneaky backdoor within the safe, which will grant a malicious smart contract permission to spend DVT tokens on behalf of the safe.
- After the safe is deployed and configured, these approval rights will enable the theft of the 10 DVT tokens initially transferred to the safe by the WalletRegistry.

### Executing the Attack
Our attack strategy has six steps:
1. **Deploy Malicious Contract:** Initially, we create a new malicious contract. Subsequently, we trigger the Gnosis Safe Factory contract, executing the `createProxyWithCallback` function.
2. **Create Gnosis Safe Proxy:** The factory, in response, deploys a fresh Gnosis Safe proxy, pointing to the masterCopy implementation.
3. **Execute Malicious Module:** The setup function is automatically executed within the new proxy, allowing our malicious module within the `MaliciousApprove` contract to grant approval for our attacker contract to manage DVT tokens on behalf of the new Safe Proxy.
4. **Callback Execution:** The callback function is activated, calling the `WalletRegistry`, which performs a series validations and checks.
5. **DVT Token Transfer:** Since all the checks passed, the `WalletRegistry` facilitates the transfer of DVT tokens to the Safe Proxy.
6. **Token Theft:** Leveraging the previously obtained allowance, we execute the transferFrom function to steal the DVT tokens from the Safe.

[Solution - AttackBackdoor.sol Contract](./contracts/player-contracts/AttackBackdoor.sol)

[Solution - Test File](./test/backdoor/backdoor.challenge.js)

[Backdoor Solution Tutorial (Full Article)](https://medium.com/p/7da8122691b3)

[![Backdoor Solution - Walkthrough Video](https://i.imgur.com/vzPVGB1.jpg)](https://youtu.be/iZAPQUF1s4M&list=PLKXasCp8iWpiKdsSR18XdAyDeYlYzMG00)


## 12 - Climber

## 13 - Wallet Mining

## 14 - Puppet V3

## 15 - ABI Smuggling