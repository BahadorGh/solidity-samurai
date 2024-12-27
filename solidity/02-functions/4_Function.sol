// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Function:
    function signature + function body

    function functionName(variableType? variableName?) Scope functionType functionModifier returns?(variableType variableName?) {
        // function body
    }

    Scopes > function & variable
        Variables:
            1- private  --> faghat dastresi az daroone hamin contract
            2- internal --> dastresi az daroone hamin contract + dastresi az daroone contract haye farzand
            3- public   --> dastresi az daroone hamin contract + dastresi az tarighe contract haye digar

        Function:
            1- private
            2- internal
            3- public
            4- external --> dastresi faghat az tarighe contract haye digar!

    
    Function Types:
        1- View         --> Read data from blockchain
        2- Pure         --> No read from blockchain + No write on blockchain
        3- Payable      --> Can accept network's native coin
        4- Non-Payable  --> Default type - Can read from blockchain + Can write on the blockchain

    Function returns:
        1- function x() scope functionType returns(uint|bool|address|...) { return ....}
        2- function x() scope functionType returns(uint|bool|address|... myVariableName) {myVariableName = 123}
*/

contract Variables_And_Functions_Scopes {
    uint public number;
    uint private age;
    bool internal isAlive;
    address myAddr = address(444); // default > internal

    function internalFunction() internal {}

    function privateFunction() private {}

    function publicFunction() public {}

    function externalFunction() external {}
}

/* variable locations:
    1- state  (state variable)  --> HDD(Hard drive)
        a. ghabele dastresi az kolle contract
        b. zakhire rooye storage
        c. bishtarin meghdar masrafe gas
    2- local  (local variable)  --> Ram
        a. ghabele tarif va dastresi faghaz az daroone function
        b. zakhire rooye memory
        c. mizan masrafe gas kheili paeinter az storage
    3- global (global variable) --> 
        a. ghabele dastresi dar kolle contaract
        b. built-in

    Global variables:
        1- msg
        2- block
        3- tx
*/

contract Functions {
    uint public number = 10; // state variable
    uint private _age; // state variable

    function setNumber() public {
        number = 20;
    }

    function setNumber(uint _number) public {
        number = _number;
    }

    function showAge() public view returns (uint) {
        return _age;
    }

    function makeMul(uint a, uint b) external pure returns (uint) {
        return a * b;
    }

    function makeSum(uint a, uint b) public pure returns (uint) {
        uint sum = a + b; // local variable
        return sum;
    }

    function makeSum2(uint a, uint b) public pure returns (uint sum) {
        sum = a + b;
    }

    function makeSum3(
        uint a,
        uint b
    ) public pure returns (uint sum, bool success) {
        sum = a + b;
        success = true;
    }

    function getSumStatus() public pure returns (uint, bool) {
        (uint sum, bool success) = makeSum3(2, 3);
        return (sum, success);
    }

    function getSumStatus2() public pure returns (bool) {
        (, bool success) = makeSum3(2, 3);
        return (success);
    }
}

contract Global_Variables {
    function whoAreYou() public view returns (address) {
        return msg.sender;
        // msg.sender > ki dare payam ro ersal mikone?
        // msg.value  > che meghdar value(native coin) dar hale ersal ast?
        // msg.data   > che dataei dar hale ersal ast?
    }

    function whatTimeIsIt() public view returns (uint) {
        return block.timestamp; // timestamp in solidity > starts from 1 Jan 1970 based on seconds
    }
}
