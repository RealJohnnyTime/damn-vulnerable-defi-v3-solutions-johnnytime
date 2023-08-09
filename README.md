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
  - [3 - Truster](#3---truster)
  - [4 - Side entrance](#4---side-entrance)
  - [5 - The rewarder](#5---the-rewarder)
  - [6 - Selfie](#6---selfie)
  - [7 - Compromised](#7---compromised)
  - [8 - Puppet](#8---puppet)
  - [9 - Puppet V2](#9---puppet-v2)
  - [10 - Free rider](#10---free-rider)
  - [11 - Backdoor](#11---backdoor)
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
[!Damn Vulnerable DeFi V3 - What's New](https://www.youtube.com/watch?v=CfR1CcO8lEI)

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


[Solution Test File](./test/unstoppable/unstoppable.challenge.ts)

[Full Article](https://medium.com/@JohnnyTime)

[![Watch the video](https://img.youtube.com/vi/SssTj52WYNM/maxresdefault.jpg)](https://www.youtube.com/@JohnnyTime)

## 2 - Naive receiver

## 3 - Truster

## 4 - Side entrance

## 5 - The rewarder

## 6 - Selfie

## 7 - Compromised

## 8 - Puppet

## 9 - Puppet V2

## 10 - Free rider

## 11 - Backdoor

## 12 - Climber

## 13 - Wallet Mining

## 14 - Puppet V3

## 15 - ABI Smuggling