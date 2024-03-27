# Use bash as shell
SHELL := /bin/bash

# Load environment variables
ifneq (,$(wildcard ./.env))
	include .env
	export
endif

# Phony targets
.PHONY: install clean build test format docs snapshot diff deploy

# Default: install deps, clean build outputs, format code, build code, run tests
all: install clean format build test

# Install dependencies
install:
	@forge install

# Clean build outputs
clean:
	@forge clean

# Build contracts + tests
build:
	@forge build
	@cp -r compiled/. out/

# Run tests
test:
	@forge test -vvv

# Verify contract
# forge verify-contract --verifier blockscout --verifier-url https://myshell-testnet-explorer.alt.technology/api --chain-id 202402181658 0xFc9bC6f4943A4073eedD0e2e6F365c99Df255478 src/SaysGM.sol:SaysGM

# Execute scripts/deploy given environment variables
deploy:
	@forge script scripts/Deploy.sol:Deploy \
		--broadcast \
		--optimize \
		--optimizer-runs 1000000 \
		--private-key $(PRIVATE_KEY) \
		--extra-output-files abi \
		--rpc-url $(RPC_URL) \
		--broadcast \
		--verify \
		--etherscan-api-key $(MYSHELL_API_KEY) \
        -vvvv

saysGM:
	@forge script scripts/Deploy.s.sol:Deploy \
		--broadcast \
		--optimize \
		--optimizer-runs 1000000 \
		--private-key $(PRIVATE_KEY) \
		--extra-output-files abi \
		--rpc-url $(RPC_URL) \
        -vvvvv

msgSender:
	@forge script scripts/DeployMsgSender.s.sol:DeployMsgSender \
		--broadcast \
		--optimize \
		--optimizer-runs 1000000 \
		--private-key $(PRIVATE_KEY) \
		--extra-output-files abi \
		--rpc-url $(RPC_URL) \
        -vvvvv

callContract:
	@forge script scripts/CallContract.s.sol:CallContract \
		--broadcast \
		--optimize \
		--optimizer-runs 1000000 \
		--private-key $(PRIVATE_KEY) \
		--extra-output-files abi \
		--rpc-url $(RPC_URL) \
        -vvvvv

callContract2:
	@forge script scripts/callContract2.s.sol:CallContract2 \
		--broadcast \
		--optimize \
		--optimizer-runs 1000000 \
		--private-key $(PRIVATE_KEY) \
		--extra-output-files abi \
		--rpc-url $(RPC_URL) \
        -vvvvv

callContract3:
	@forge script scripts/CallContract3.s.sol:CallContract3 \
		--broadcast \
		--optimize \
		--optimizer-runs 1000000 \
		--private-key $(PRIVATE_KEY) \
		--extra-output-files abi \
		--rpc-url $(RPC_URL) \
        -vvvvv

# Save gas snapshot
snapshot:
	@forge snapshot

# Compare current gas profile to saved gas snapshot
diff:
	@forge snapshot --diff

# Format contracts
format:
	@forge fmt

# Generate and serve docs
docs:
	@forge doc --build
	@open http://localhost:4000
	@forge doc --serve --port 4000
