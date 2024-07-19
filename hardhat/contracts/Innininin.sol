// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Innininin is ERC20, Ownable {
    uint256 public immutable MAX_SUPPLY;

    /**
     * @dev Constructor to initialize the Innininin token
     * @param name_ The name of the token
     * @param symbol_ The symbol of the token
     * @param maxSupply_ The maximum supply of the token
     */
    constructor(string memory name_, string memory symbol_, uint256 maxSupply_) ERC20(name_, symbol_) {
        MAX_SUPPLY = maxSupply_;
    }

    /**
     * @notice Mints new tokens
     * @dev Only the owner can mint new tokens and the total supply cannot exceed MAX_SUPPLY
     * @param to The address to receive the minted tokens
     * @param amount The amount of tokens to mint
     */
    function mint(address to, uint256 amount) external onlyOwner {
        require(totalSupply() + amount <= MAX_SUPPLY, "Exceeds maximum supply");
        _mint(to, amount);
    }

    /**
     * @notice Burns tokens from the caller's balance
     * @param amount The amount of tokens to burn
     */
    function burn(uint256 amount) external {
        _burn(_msgSender(), amount);
    }
}