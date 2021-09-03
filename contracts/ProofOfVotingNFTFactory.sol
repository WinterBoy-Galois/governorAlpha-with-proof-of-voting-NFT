pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

import { ProofOfVotingNFT } from "./ProofOfVotingNFT.sol";


/**
 * @notice - This is the factory smart contract of NFT that represents a proof of voting
 */
contract ProofOfVotingNFTFactory {

    address[] public proofOfVotingNFTAddresses;
    mapping (address => address) nftOwners;  // [Key]: Owner address -> NFT address (of the Proof of voting)

    constructor() public {}

    function createNewProofOfVotingNFT() public returns (bool) {
        ProofOfVotingNFT proofOfVotingNFT = new ProofOfVotingNFT();

        address PROOF_OF_VOTING_NFT = address(proofOfVotingNFT);
        proofOfVotingNFTAddresses.push(PROOF_OF_VOTING_NFT);
        nftOwners[PROOF_OF_VOTING_NFT] = msg.sender;
    }


    //----------------
    // Getter methods
    //----------------

    /**
     * @notice - This method return number of NFTs which voter has.
     */
    function getCountOfProofOfVotingNFTs(address voter) public view returns (uint _countOfProofOfVotingNFTs) {
        uint countOfProofOfVotingNFTs;

        for (uint i=0; i < proofOfVotingNFTAddresses.length; i++) {
            address nftOwner = proofOfVotingNFTAddresses[i];

            if (nftOwner == voter) {
                countOfProofOfVotingNFTs++;
            }
        }

        return countOfProofOfVotingNFTs;
    }


}