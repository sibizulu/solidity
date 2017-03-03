pragma solidity ^0.4.4;

contract Tracks {
  struct Strack{
    uint trackId;
    bytes32 trackName;
    mapping (uint => Owner) ownersDetails;
  }

  struct Owner {
    bytes32 name;
    bytes32 mail;
    bytes32 isni;
    bytes32 percentage;
  }

  Owner thisOwner;
  Strack[] public Stracks;

  function saveTrackDetails(
      uint _trackId,
      bytes32 _trackName,
      bytes32[] _ownersName,
      bytes32[] _ownersMail,
      bytes32[] _ownersIsni,
      bytes32[] _ownersPercentage){

   mapping (uint => Owner) ownersDetails;

    for(uint i = 0; i < _ownersName.length; i++) {
        Owner memory _ownersDetails;
        _ownersDetails.name = "tees";
        _ownersDetails.mail = "tees";
        _ownersDetails.isni = "tees";
        _ownersDetails.percentage = "tees";
       ownersDetails[i] = _ownersDetails;
    }

    Stracks.push(Strack({
      trackId: _trackId,
      trackName: _trackName
    }));
  }

  function getTrackDetails(uint _trackId) constant returns (uint trackId, bytes32 trackName){


    Strack trackDetails = Stracks[_trackId];
    trackName = trackDetails.trackName;
    trackId =  trackDetails.trackId;
  }
}
