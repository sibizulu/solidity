pragma solidity ^0.4.0;

contract GroupManager {

  struct Group {
      bytes32 groupName;
      uint groupFee;
      uint groupExpiry;
      uint groupCreated;
      uint groupStatus;
      uint totalAmount;
      uint memberCount;
      mapping (uint => GroupMember) GroupMembers;
  }

  struct GroupMember {
      address memberAddress;
  }

  uint groupId;
  address AdminGroupManager;
  mapping (uint => Group) Groups;

  function GroupManager() {
      AdminGroupManager = msg.sender;
  }

  function CreateGroup (bytes32 groupName, uint groupFee, uint groupSeconds) public returns (uint thisGroupId){
      if (AdminGroupManager != msg.sender) throw;
      thisGroupId = groupId++;
      Group memory thisMember;
      thisMember.groupName = groupName;
      thisMember.groupFee = groupFee;
      thisMember.groupCreated = now;
      thisMember.groupExpiry = now + groupSeconds;
      thisMember.groupStatus = 0;
      Groups[thisGroupId] = thisMember;
  }

  function MemberJoin (uint groupId) payable {
      if (AdminGroupManager == msg.sender) throw;
      Group id = Groups[groupId];
      if (msg.value != id.groupFee) throw;
      id.GroupMembers[id.memberCount++] = GroupMember(msg.sender);
      id.totalAmount += msg.value;
  }

  function closeGroup (uint groupId) payable {
      if (AdminGroupManager != msg.sender) throw;
      Group id = Groups[groupId];
      id.groupStatus = 1;
  }
}
