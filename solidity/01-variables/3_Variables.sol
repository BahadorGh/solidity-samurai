// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Variables:
    Value Types: (max > one slot of storage)
        1- Numbers:
            a. Integer
            b. Unsigned Integer
        2- Boolean
        3- Address
        4- Enum
        5- BytesN
        6- Fixed-sized arrays

    Reference Types:
        1- Arrays(Dynamically-sized arrays)
        2- String
        3- Mapping
        4- Bytes
        5- Struct
*/

contract Number_Variables {
    // default value: 0
    // Integer <> int >> - 0 + <<>>  -~ > 0 < +~
        // int256 <> int
        // int8 --> (-2 ** 7) ta (+2 ** 7) - 1 <==> -128 ta +127
        // int16 --> (-2 ** 15) ta (+2 ** 15) - 1
        // int24 --> (-2 ** 23) ta (+2 ** 23) - 1
        // int64 --> (-2 ** 63) ta (+2 ** 63) - 1
        // int128 --> (-2 ** 127) ta (+2 ** 127) - 1
        // int256 --> (-2 ** 255) ta (+2 ** 255) - 1

    int8 public int8Min = type(int8).min;
    int8 public int8Max = type(int8).max;

    // Unsigned Integer <> uint  >> 0 + <<>>  0 < +~
        // uint256 <> uint
        // uint8 -->   0 ta (+2 ** 8) - 1 <==> 0 ta +255
        // uint16 -->  0 ta (+2 ** 16) - 1
        // uint24 -->  0 ta (+2 ** 24) - 1
        // uint64 -->  0 ta (+2 ** 64) - 1
        // uint128 --> 0 ta (+2 ** 128) - 1
        // uint256 --> 0 ta (+2 ** 256) - 1

    uint8 public uint8Min = type(uint8).min;
    uint8 public uint8Max = type(uint8).max;
    
    // uint8 public uint8Max2 = 256; error
}

contract Boolean_Variables {
    // Boolean > false | true (0 | 1)
    // default value: 0x00
    bool public isAlive = true;
    bool public registered = false;

    bool public boolAnd = isAlive && registered; // (true && false) > false
    bool public boolOr = isAlive || registered; //  (true && false) > true
    bool public boolNot = !isAlive; // !(true) > false

    bool public isGreaterThan = 2 >= 5; // false
    bool public isLowerThan = 2 <= 5; // true
}

contract Address_Variables {
    // Address | Address Payable >> 20bytes <> 160bits
    // default value: 0x00000.....0000
    address public defaultAddressValue; // 0x00000.....0000
    address public userAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address payable public anotherUserAddress = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

    address public myAddress = address(1);   // 0x00000.....0001 
    address public myAddress2 = address(10); // 0x00000.....000A
    address public myAddress3 = address(15); // 0x00000.....000F
    address public myAddress4 = address(16); // 0x00000.....0010
    // 0123456789abcdef
}

contract Enum_Variables {
    // Enum > uint8
    // default value: 0
    enum WeekDays {
        SHANBE,         // 0
        YEKSHANBE,      // 1
        DOSHANBE,       // 2
        SESHANBE,       // 3
        CHAHARSHANBE,   // 4
        PANJSHANBE,     // 5
        JOME            // 6
    }

    WeekDays public wDays = WeekDays.DOSHANBE;
}

contract BytesN_Variables {
    // default value: 0x00
    // bytes1 bytes2 bytes3 bytes4 .... bytes31 bytes32
    bytes1 public bytes1Value = "1"; // 0x31
    bytes1 public bytes1Value_2 = "2"; // 0x32
    bytes1 public bytes1Value_3 = "b"; // 0x62

    bytes3 public bytes3Value = "123";
    bytes32 public bytes32Value = "123123";

    bytes6 public bytes6Value = hex"123456";
}

contract Fixed_Sized_Arrays_Variables {
    // [2] => [x, y]
    uint8[3] public myNumberArray = [1]; // >>> [1,0,0]
    int8[3] public myNumberArray_2 = [-1,2,3];

    bool[2] public myBoolArray = [true, false];
    address[2] public myAddressArray = [address(1), address(5)];

    bytes3[2] public myBytesArray = [bytes3("123"), bytes3("456")];
}

contract Dynamically_Sized_Arrays_Variables {
    uint8[] public myNumberArray;
    uint8[] public myNumberArray2 = [1,2,3,4,5,6];

    bool[] public myBooleanArray = [true, false,false,false, true];
    address[] public myAddressArray = [address(1), address(2),address(3),address(4), address(5)];
}

contract String_Variables {
    string public message = "Hello ";
    string public name = "Bahador";
    string public userName = 'bahador';
    string public number = "123";

    string public emoji = unicode"🤑";
    string public entranceMesg = string.concat(message, name, emoji);
}

contract Mapping_Variables {
    // key > value
    // mapping(keyType => valueType) mappingName;
    
    // nested mapping
    // mapping(mapping(key => value) => value) mappingName;
    // mapping(mapping(mapping(key => value) => value) => value) mappingName;
    // mapping(mapping(mapping(mapping(key => value) => value) => value) => value) mappingName;

    mapping (address => uint) public balance;
    mapping (address => mapping (address => uint)) public allowance;
    mapping (uint id => string name) public userName;

    function updateBalanceMapping() public {
        balance[address(1)] = 123456;
    }
    function updateAllowanceMapping() public {
        allowance[address(1)][address(2)] = 123456;
    }
    function updateUsernameMapping() public {
        userName[5] = "bahador";
    }
}

contract Bytes_Variables {
    // bytes >> dynamically-szed-byte-array
    bytes public myBytesValue = "Salam doostan. Omidvaram haletoon khoob bashe. Emrooz jalase 3vom doreye Solidity Samurai ro darim mibinim. Merc ke inja ba man hastin. Omidvaram baratoon mofid bashe in dore.........! Salam doostan. Omidvaram haletoon khoob bashe. Emrooz jalase 3vom doreye Solidity Samurai ro darim mibinim. Merc ke inja ba man hastin. Omidvaram baratoon mofid bashe in dore.........! Salam doostan. Omidvaram haletoon khoob bashe. Emrooz jalase 3vom doreye Solidity Samurai ro darim mibinim. Merc ke inja ba man hastin. Omidvaram baratoon mofid bashe in dore.........! Salam doostan. Omidvaram haletoon khoob bashe. Emrooz jalase 3vom doreye Solidity Samurai ro darim mibinim. Merc ke inja ba man hastin. Omidvaram baratoon mofid bashe in dore.........! Salam doostan. Omidvaram haletoon khoob bashe. Emrooz jalase 3vom doreye Solidity Samurai ro darim mibinim. Merc ke inja ba man hastin. Omidvaram baratoon mofid bashe in dore.........! Salam doostan. Omidvaram haletoon khoob bashe. Emrooz jalase 3vom doreye Solidity Samurai ro darim mibinim. Merc ke inja ba man hastin. Omidvaram baratoon mofid bashe in dore.........! Salam doostan. Omidvaram haletoon khoob bashe. Emrooz jalase 3vom doreye Solidity Samurai ro darim mibinim. Merc ke inja ba man hastin. Omidvaram baratoon mofid bashe in dore.........! Salam doostan. Omidvaram haletoon khoob bashe. Emrooz jalase 3vom doreye Solidity Samurai ro darim mibinim. Merc ke inja ba man hastin. Omidvaram baratoon mofid bashe in dore.........! Salam doostan. Omidvaram haletoon khoob bashe. Emrooz jalase 3vom doreye Solidity Samurai ro darim mibinim. Merc ke inja ba man hastin. Omidvaram baratoon mofid bashe in dore.........!";
}

contract Struct_Variables {
    // User
    struct User {
        string fName;
        string lName;
        uint age;
        bool isAlive;
        string homeAddress;
        address walletAddress;
    }

    User public user;
    User[2] public users;
    User[] public users1;
    mapping(uint id => User) public thisUsers;

    function insertUser() public {
        users[0] = User({
            fName: "Bahador",
            lName: "GhadamKheir",
            age: 75,
            isAlive: true,
            homeAddress: "My Home",
            walletAddress: address(777)
        });

        users[1] = User(
            "Bahador",
            "GhadamKheir",
            75,
            true,
            "My Home",
            address(777)
        );

        thisUsers[2] = User({
            fName: "Bahador",
            lName: "GhadamKheir",
            age: 75,
            isAlive: true,
            homeAddress: "My Home",
            walletAddress: address(777)
        });

        thisUsers[3] = User(
            "Bahador",
            "GhadamKheir",
            75,
            true,
            "My Home",
            address(777)
        );

        user = User({
            fName: "Bahador",
            lName: "GhadamKheir",
            age: 75,
            isAlive: true,
            homeAddress: "My Home",
            walletAddress: address(777)
        });

        users1.push(User({
            fName: "Bahador",
            lName: "GhadamKheir",
            age: 75,
            isAlive: true,
            homeAddress: "My Home",
            walletAddress: address(777)
        }));
    }
}