// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constructor_Function {
    address public owner;
    uint256 public deployTime;

    constructor() {
        owner = msg.sender;
        deployTime = block.timestamp;
    }
}

/* Data Location:
    storage | memory | calldata | (code | stack)

        memory      > read & write
        calldata    > readonly
*/
contract FunctionsAgain {
    string name;

    function updateName(string calldata _name) external {
        name = _name;
    }

    function getName() external view returns (string memory) {
        return name;
    }
}

/* Constant - Immutable:
    constant > 
        1- Meghdare avalie bayad behesh dad
        2- digar nemitavan meghdarash ra taghir dad
    immutable > 
        1- meghdar dehi, ya dar zamane tarif, ya dar zamane ejra shodane constructor
        2- digar nemitavan meghdarash ra taghir dad(bad az ejra shodane constructor)

    Note: constant va immutable ha, dar storage zakhire nemishavand! (dar bytecode gharar migirand)
*/
contract Constant_Immutable_Variables {
    address public constant OWNER = address(1);
    address public immutable ANOTHER_OWNER;

    constructor() {
        ANOTHER_OWNER = msg.sender;
    }
}

contract Fixed_Sized_Array_Functions {
    // fixed-sized array
    uint256[3] public ages = [10, 20]; // dar araye ha, element ha(anaser) az 0 shoroo mishavand.

    // dynamically-sized array
    uint[] public numbers;

    function addToAgesArray() public {
        ages[2] = 30;
    }

    function updateAgesArray() public {
        ages[0] = 90;
    }

    function readFromAgesArray() public view returns (uint) {
        return ages[0];
    }

    function readAllFromAgesArray() public view returns (uint[3] memory) {
        return ages;
    }

    function deleteFromAgesArray() public {
        delete ages[1]; // delete <-> reset(back to the initial value)
    }

    function showAgesArrayLength() public view returns (uint) {
        return ages.length;
    }
}

contract Dynamicall_Sized_Array_Functions {
    uint[] public numbers;
    uint[] public numbers2 = [1, 2];

    function addToNumbersArray() public {
        numbers.push(20); // ezafe kardane onsor be entehaye araye
    }

    function removeFromNumbersArray() public {
        numbers.pop(); // hazfe akharin onsor az araye
    }

    function showNumbersArrayLength() public view returns (uint) {
        return numbers.length;
    }

    function updateNumbersArray() public {
        numbers[2] = 22;
    }

    function showNumbersArray() public view returns (uint[] memory) {
        return numbers;
    }

    function updateMyNumbers2Array() public {
        numbers2 = numbers;
    }

    function updateMyNumbers2Array2() public {
        uint[] storage numbers3 = numbers;
        numbers3.push(444);
    }

    function readAllFromNumbers2Array() public view returns (uint[] memory) {
        return numbers2;
    }
}
