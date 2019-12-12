pragma solidity ^0.5.0;

contract SocialNetwork {
	string public name;
	uint public postCount =0; 
    mapping (uint => Post) public posts;
    
	struct Post{
		uint id;
		string content;
		uint tipAmount;
		address payable author;
	}

	event PostCreated(
		uint id,
		string content,
		uint tipAmount,
		address payable author
	);

	event PostTipped(
		uint id,
		string content,
		uint tipAmount,
		address payable author
	);

	constructor() public {
		name = "Vaisen Social Network";
	} 

	function createPost(string memory _content) public {
		// require valid content
		require(bytes(_content).length > 0 );
       //increment post count
        postCount ++;
		//_post = Post(_id,  _content, 0, msg.sender); 
		posts[postCount] = Post(postCount, _content, 0, msg.sender);
		//trigar Event
		emit PostCreated(postCount, _content, 0, msg.sender);

	}

	//tips post

	function tipPost(uint _id) public payable {
		require(_id > 0 && _id <= postCount);
		//Fetch the post
		Post memory _post = posts[_id];
		//fetch the author
		address payable _author = _post.author;
		//pay the author
		address(_author).transfer(msg.value);
		//incremet the tips amount
		_post.tipAmount = _post.tipAmount + msg.value;
		//Update the post
		posts[_id] = _post;
		//Triger on event_
		emit PostTipped(postCount, _post.content, _post.tipAmount, _author);
	}
}
