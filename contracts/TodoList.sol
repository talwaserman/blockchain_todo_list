pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    constructor() public {
        createTask("hello world");
    }
    
    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
        // solidity allow us to broadcast events, and consumers can subscribe to know when event happened.
        emit TaskCreated(taskCount, _content, false);
    }
}