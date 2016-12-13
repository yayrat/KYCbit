pragma solidity ^0.4.4;
import "https://github.com/ethereum/dapp-bin/library/stringUtils.sol";
contract KYCbit5 {
    /* Public variables of the token */
    address  public owner;
    uint8    public isins;
    bytes8  public bananax;
    bytes8  public varex;
    
    //Data store
    mapping (bytes8  => address) public HashToAddress;
    mapping (bytes8  => string ) public HashToBIK;
    mapping (bytes8  => string ) public HashToIntID;
    
    //Administration
    mapping (address => string ) public UserBIK;
    
    
    /* Initialization*/
    function KYCbit5() {
        owner = msg.sender;
        bananax = 'ananax';
    }

    function AddUser(string _BIK, address _address) returns (bool _result){
        if (msg.sender == owner){
            UserBIK[_address] = _BIK;
            return _result = true;
        }
        else{
            return _result = false;
        }
    }
    
    function UCustomerInsert(string _BIK, bytes8 _hash, string _intID) returns (bool _result){
        if (StringUtils.equal(_BIK, UserBIK[msg.sender])){
            HashToAddress[_hash] = msg.sender;
            HashToBIK[_hash] = _BIK;
            HashToIntID[_hash] = _intID;
            varex = _hash;    
            return true;
        }else{
            return false;
        }
        
    }
    
    function CustomerInsert(string _BIK, bytes8 _hash, string _intID) returns (bytes8 result){
        //HashToAddress[_hash] = msg.sender;
        HashToBIK[_hash] = _BIK;
        HashToIntID[_hash] = _intID;
        varex = _hash;
    return _hash;
    }
    
    function BIKQuery(bytes8 _hash) constant returns (string BIK){
        return HashToBIK[_hash];
    }

    function AddressQuery(bytes8 _hash) constant returns (address _address){
        return HashToAddress[_hash];
    }
    
    function IntIDQuery(bytes8 _hash) constant returns (string _intID){
        return HashToIntID[_hash];
    }
    
    function test() constant returns (string _BIK, string IntID){
//         return (HashToBIK[0xa18fdc5ca4dab088722bcaf62a31255dca032f76], HashToIntID[0xa18fdc5ca4dab088722bcaf62a31255dca032f76]);
           return (HashToBIK['ananax'], HashToIntID['ananax']);
    }
    
    
    /* This unnamed function is called whenever someone tries to send ether to it */
    function () {
        throw;     // Prevents accidental sending of ether
    }
}
