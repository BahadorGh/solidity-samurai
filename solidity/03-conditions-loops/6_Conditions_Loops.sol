// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Conditions & Loops:
    1- Condition:
        if(condition) { ... } else if(another condition) { ... } else { ... }

    2- Loops:
        for(uint initialValue; end of loop condition; step) { ... }
        while(condition) { ... }
        do { ... } while(condition)
*/

contract Conditions {
    uint public age = 20;

    function updateAge(uint _age) public returns (bool) {
        if(_age < 100 && _age > 20) {
            age = _age;
            return true;
        } else if ( _age == 20) {
            return true;
        } else {
            return false;
        }
    }

    function updateAge2(uint _age) public pure returns (string memory) {
        if(_age <= 100 && _age >= 10) {
            if(_age >= 10 && _age <= 30) {
                return "You are young!";
            } else if (_age > 30 && _age <= 90) {
                return "You are getting old!";
            } else {
                return unicode"You are gonna die!😈";
            }
        }
        return "";
    }
}

contract Loops {
    uint public sum;

    function makeSumFor(uint number) public returns (uint) {
        for(uint i; i < number; i++) {
            sum += i; // sum = sum + number | (sum -= number)sum = sum - number | (sum *= number)sum = sum * number | | (sum /= number)sum = sum / number
        }
        return sum;
    }

    function makeSumWhile(uint number) public returns (uint) {
        uint i;
        while(i < number) {
            sum += i;
            i++;
        }
        return sum;
    }

    function makeSumDoWhile(uint number) public returns (uint) {
        uint i;
        do {
            sum += i;
            i++;
        } while(i < number);
        return sum;
    }

    function resetSum() public {
        delete sum;
    }
}