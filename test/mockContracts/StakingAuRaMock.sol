pragma solidity 0.5.2;

import '../../contracts/StakingAuRa.sol';


contract StakingAuRaMock is StakingAuRa {

    // ============================================== Modifiers =======================================================

    modifier onlyValidatorSetContract() {
        require(msg.sender == _getValidatorSetAddress());
        _;
    }

    // =============================================== Setters ========================================================

    function addToPoolsMock(address _stakingAddress) public {
        _addToPools(_stakingAddress);
    }

    function addToPoolsInactiveMock(address _stakingAddress) public {
        _addToPoolsInactive(_stakingAddress);
    }

    function resetErc20TokenContract() public {
        addressStorage[ERC20_TOKEN_CONTRACT] = address(0);
    }

    function setCurrentBlockNumber(uint256 _blockNumber) public {
        uintStorage[keccak256("currentBlockNumber")] = _blockNumber;
    }

    function setValidatorSetAddress(address _validatorSetAddress) public {
        addressStorage[keccak256("validatorSetAddress")] = _validatorSetAddress;
    }

    // =============================================== Private ========================================================

    function _getCurrentBlockNumber() internal view returns(uint256) {
        return uintStorage[keccak256("currentBlockNumber")];
    }

    function _getMaxCandidates() internal pure returns(uint256) {
        return 100;
    }

    function _getValidatorSetAddress() internal view returns(address) {
        return addressStorage[keccak256("validatorSetAddress")];
    }

}
