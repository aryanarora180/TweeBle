// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract TweeBle {
    string public name = "TweeBle";
    uint256 public tweetCount = 0;
    mapping(uint256 => Tweet) public tweets;

    struct Tweet {
        uint id;
        string content;
        uint256 timestamp;
        uint256 likes;
        uint256 tipAmount;
        address payable author;
    }

    event TweetPosted(
        uint id,
        string content,
        uint256 timestamp,
        uint256 likes,
        uint256 tipAmount,
        address payable author
    );

    event TweetLiked(
        uint id,
        string content,
        uint256 timestamp,
        uint256 likes,
        uint256 tipAmount,
        address payable author
    );

    event TweetTipped(
        uint id,
        string content,
        uint256 timestamp,
        uint256 likes,
        uint256 tipAmount,
        address payable author
    );

    function getTweet(uint id) public view returns (string memory) {
        return tweets[id].content;
    }

    function postTweet(string memory _content) public {
        // Check to make sure string is empty or not
        require(bytes(_content).length > 0);

        tweetCount++;
        tweets[tweetCount] = Tweet(
            tweetCount,
            _content,
            block.timestamp,
            0,
            0,
            payable(msg.sender)
        );

        emit TweetPosted(tweetCount, _content, block.timestamp, 0, 0, payable(msg.sender));
    }

    
}
    