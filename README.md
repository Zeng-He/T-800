# Transaction-Validator 800 (T-800)

## Disclaimer
This is a proof-of-concept project. It is not recommended to use it for production environments.

## Intention
This system provide the functionality to check if individual transactions were validated on Ethereum mainnet.
For that is uses Ethescan API.

## Set-up
- To set up the project the following dependencies are required:
    * Erlang/OTP 22
    * Elixir/Mix 1.13.4
    * Phoenix

- After git-pull the files run:
    - `mix deps.get`
    - `mix deps.compile`

Go to config/config.ex and update `your-etherscan-api-key` with your api key.

Run `mix phx.server` to run your server :)

## Limitations
If an invalid transaction id is provided, eg: `0x0`, this will assume that the transaction is valid.
This is a limitation of the Etherscan API itself.

# Real-World Use-Case for this Project
-	To use as part of a subsytem which sends transactions and could help the user to check if their transaction went trough without leaving the site.
-   Transaction validator is just a part in the system. This could be expanded as a toolbox for a blockchain scan suite.

# Development-Goal
-   To gain familiarity with Elixir and Phoenix
-   To build an aplication on top of a block explorer
-   To get started with Etherscan API
-   To gain familiarity with functional programming