 pragma solidity ^0.5.2;

 contract Proposals {
    /***************
    EVENTS
    ***************/
    event SubmitProposal(
      uint256 proposalIndex,
      uint256 tokenTribute,
      uint256 sharesRequested,
      address indexed delegateKey,
      address indexed memberAddress,
      address[] indexed candidates
      );
    
    event ProcessProposal(
      uint256 indexed proposalIndex,
      uint256 tokenTribute,
      uint256 sharesRequested,
      address indexed electedCandidate,
      address indexed memberAddress,
      bool didPass
      );


    struct Ballot {
        uint256[] votes;
        uint256[] quadraticVotes;
        address[] candidate;
    }


    struct Proposal {
        address proposer; // the member who submitted the proposal
        address electedCandidate; // address of an electeed candidate
        bool processed; // true only if the proposal has been processed
        bool didPass; // true only if the proposal has elected a candidate
        bool aborted; // true only if applicant calls "abort" fn before end of voting period
        uint256 sharesRequested; // the # of shares the applicant is requesting
        uint256 startingPeriod; // the period in which voting can start for this proposal
        uint256 yesVotes; // the total number of YES votes for this proposal
        uint256 noVotes; // the total number of NO votes for this proposal
        uint256 tokenTribute; // amount of tokens offered as tribute
        uint256 maxTotalSharesAtYesVote; // the maximum # of total shares encountered at a yes vote on this proposal
        address[] candidates; // list of candidates to include in a ballot
        uint256[] totalVotes; // total votes each candidate received
        uint256[] totalQuadraticVotes; // calculation of quadratic votes for each candidate
        string details; // proposal details - could be IPFS hash, plaintext, or JSON
        mapping (address => Ballot) votesByMember; // list of candidates and corresponding votes
    }

    Proposal[] public proposalQueue;

    function getProposalVoteState (
      uint256 index
    ) public view returns (
      address proposer,
      address electedCandidate,
      bool processed,
      bool didPass,
      bool aborted,
      uint256 sharesRequested,
      uint256 startingPeriod,
      uint256 yesVotes,
      uint256 noVotes,
      uint256 tokenTribute,
      uint256 maxTotalSharesAtYesVote

    ) {
      Proposal storage proposal = proposalQueue[index];
      proposer = proposal.proposer;
      electedCandidate = proposal.electedCandidate;
      processed = proposal.processed;
      didPass = proposal.didPass;
      aborted = proposal.aborted;
      sharesRequested = proposal.sharesRequested;
      startingPeriod = proposal.startingPeriod;
      yesVotes = proposal.yesVotes;
      noVotes = proposal.noVotes;
      tokenTribute = proposal.tokenTribute;
      maxTotalSharesAtYesVote = proposal.maxTotalSharesAtYesVote;
    }

    /*
          address proposer,
      address electedCandidate,
      bool processed,
      bool didPass,
      bool aborted,
      uint256 sharesRequested,
      uint256 startingPeriod,
      uint256 yesVotes,
      uint256 noVotes,
      uint256 tokenTribute,
      uint256 maxTotalSharesAtYesVote,
      address[] memory candidates,
      uint256[] memory totalVotes,
      uint256[] memory totalQuadraticVotes,
      string memory details
    */

 }