// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.28;

import "./ThePiggyBank.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";

 // contract that creates new ThePiggyBank instances using CREATE2
contract PiggyBankFactory {
    address public immutable implementation;
    address public owner;

    event PiggyBankCreated(
        address indexed piggyBankAddress,
        address indexed ownerAddress,
        string purpose,
        uint256 duration,
        address devAddress
    );

    constructor(address _implementation) {
        implementation = _implementation;
        owner = msg.sender;
    }

    

//Creates a new ThePiggyBank using CREATE2
    function createPiggyBank(
         //_owner Address of the PiggyBank owner
        address _owner,
        //Purpose of the piggy bank
        string memory _purpose,
        //Duration for which funds will be locked
        uint256 _duration,
        //Address that will receive penalty fees
        address _devAddress,
        //Address of the USDT token
        address _usdt,
        //Address of the USDC token
        address _usdc,
        // Address of the DAI token
        address _dai,
        //A unique salt value used to determine the address
        bytes32 _salt
    ) external returns (address instance) {
        // Use CREATE2 to deploy a clone of the implementation with deterministic address
        bytes memory initData = abi.encodeWithSignature(
            "initialize(address,string,uint256,address,address,address,address)",
            _owner,
            _purpose,
            _duration,
            _devAddress,
            _usdt,
            _usdc,
            _dai
        );

        instance = Clones.cloneDeterministic(implementation, _salt);
        
        // Call the initialize function on the new instance
        (bool success, ) = instance.call(initData);
        require(success, "Initialization failed");

        emit PiggyBankCreated(
            instance,
            _owner,
            _purpose,
            _duration,
            _devAddress
        );

        return instance;
    }

    //The salt value to be used in CREATE2
    function predictPiggyBankAddress(bytes32 _salt) public view returns (address) {
        return Clones.predictDeterministicAddress(implementation, _salt, address(this));
    }
}