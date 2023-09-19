# Simple Blockchain in Ruby

This repository contains a simple implementation of a blockchain in Ruby. The blockchain is implemented through a `Block` class that allows for the creation and linking of individual blocks using cryptographic hashes.

## Dependencies

- Ruby
- Digest library for Ruby
- Pretty Print (pp) library for Ruby

To install Ruby, follow the instructions on the [official website](https://www.ruby-lang.org/en/documentation/installation/).

## Credits

This project was inspired and guided by the tutorial in the following YouTube video:

[![Blockchain Tutorial](http://img.youtube.com/vi/xAHTddYzzdU/0.jpg)](http://www.youtube.com/watch?v=xAHTddYzzdU "Blockchain Tutorial")

I highly recommend checking out the video for a detailed walkthrough of the blockchain concept and how to implement it in Ruby.

Special thanks to the creator of the video for providing the knowledge and inspiration to build this project.

## Usage

To use the blockchain, you would create instances of the `Block` class and link them together by using the hash of the previous block. Here is a basic example:

```ruby
b0 = Block.first("Genesis")
b1 = Block.next(b0, "Transaction Data...")
b2 = Block.next(b1, "Transaction Data......")
b3 = Block.next(b2, "More Transaction Data...")
b4 = Block.next(b3, "Transaction Data...")

blockchain = [b0, b1, b2, b3, b4]

pp blockchain





