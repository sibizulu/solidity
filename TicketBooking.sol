pragma solidity ^0.4.0;

contract Theater{

  address public owner;
  mapping (address => uint) public balances;
  uint public totalSeats;
  uint public bookCount;

  function Theater(){
    owner = msg.sender;
    totalSeats = 500;
    bookCount = 0;
  }

  function buyTicket() public returns (bool success){
    if (bookCount >= totalSeats) return false;
    balances[msg.sender] = msg.value;
    bookCount++;
    return true;
  }

  function refundTicket(address reciever, uint amt) public {
    if (msg.sender != owner) return;
    if (balances[reciever] == amt){
      address contractAddress = this;
      if (contractAddress.balance >= amt) {
        if(reciever.send(amt))
        throw;
        balances[reciever] = 0;
        bookCount--;
      }
    }
  }

  function destroy(){
    if (msg.sender == owner) suicide(owner);
  }
}
