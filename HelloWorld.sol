contract HelloWorld {
    address public owner;
    mapping (address => uint) balance;


    function HelloWorld(){
        owner = msg.sender;
        balance[owner] = 1000;
    }

    function transfer(address _to,uint _value) returns (bool success){
        if (balance[msg.sender] < _value){
            return false;
        }
        balance[msg.sender] -= _value;
        balance[_to] += _value;
        return true;
    }
    function getBalance(address _user) returns (uint _balance){
        return balance[_user];
    }
}
