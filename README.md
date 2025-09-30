# Modifiers vs Ifs — Solidity Practice Project

A tiny practice project to demonstrate two common patterns for access control in Solidity:

- Using a function modifier (isOwner)
- Using an inline conditional check (if / require) inside the function body

This project includes two simple contracts that both restrict who can update a stored message to only the contract owner.

## Contracts

1) ContractModifiersExample
- Stores the deployer as `owner` and a `message` string
- Uses the `isOwner` modifier to guard `updateMessage`

2) ContractExample
- Stores the deployer as `owner` and a `message` string
- Uses an inline check inside `updateMessage` to revert when `msg.sender` is not the owner

## Project Layout

- modifers-vs-ifs.sol — source file with both example contracts
- artifacts/ — compiled JSON artifacts (ABI and metadata)

Note: There is no Hardhat/Foundry configuration in this folder; this project is set up to be quickly explored with Remix.

## Quick Start (Remix IDE)

1) Open https://remix.ethereum.org in your browser.
2) Create a new file in Remix named `modifers-vs-ifs.sol` and paste the contents of this repository’s file.
3) Make sure the compiler version is compatible with the pragma in the file (e.g., 0.8.20 fits `>0.8.15 <0.9.0`).
4) Compile the contract.
5) In the Deploy & Run tab:
   - Select `ContractModifiersExample` and deploy. The deployer account becomes `owner`.
   - Call `updateMessage("Hello")`. It should succeed for the owner account and revert for others.
   - Repeat with `ContractExample` and try `updateMessage` from the owner and a non-owner account to observe the difference.

## What to Look For

- Both approaches enforce the same rule, but modifiers let you centralize reusable preconditions.
- Inline checks can be fine for one-off logic, but tend to repeat across functions.

## Example Interactions

- Read `owner` to confirm which address is allowed to update.
- Read `message` before and after calling `updateMessage`.
- Try `updateMessage` from a different account to see the revert message: "You need to be the owner in order to update the message".

## Next Steps (Optional)

If you want to run this locally with a toolchain:

- Hardhat: initialize a project and move this file into `contracts/`, then compile and test.
- Foundry: `forge init`, place the file under `src/`, update the pragma if needed, and `forge build`.

These steps are optional and not required to explore the code via Remix.

## License

MIT
