# phony targets are targets that don't actually create a file
.phony: deploy

# anvil's third default address
sender := xxxxxx
RPC_URL := https://myshell-testnet.alt.technology

# deploying the contract
deploy:
	@PRIVATE_KEY=$(sender) forge script script/Deploy.s.sol:Deploy --broadcast --rpc-url $(RPC_URL)

# calling sayGM()
call-contract:
	@PRIVATE_KEY=$(sender) forge script script/CallContract.s.sol:CallContract --broadcast --rpc-url $(RPC_URL)
