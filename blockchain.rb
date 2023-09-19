require "digest"
require "pp"

class Block
  attr_reader :index
  attr_reader :timestamp
  attr_reader :data
  attr_reader :previous_hash
  attr_reader :nonce
  attr_reader :hash

  def initialize(index, data, previous_hash)
    @index = index
    @timestamp = Time.now
    @data = data
    @previous_hash = previous_hash
    @nonce, @hash = compute_hash_with_proof_of_work
  end

  def compute_hash_with_proof_of_work(difficulty="00")
    nonce = 0
    loop do
      hash = compute_hash_with_nonce(nonce)
      if hash.start_with?(difficulty)
        return [nonce,hash]
      else
        nonce += 1
      end
    end
  end

  def compute_hash_with_nonce(nonce=0)
    sha = Digest::SHA256.new
    sha.update( nonce.to_s + @index.to_s + @timestamp.to_s + @data + @previous_hash )
    sha.hexdigest
  end

  def self.first( data="Genesis" )    
    Block.new( 0, data, "0" )
  end

  def self.next( previous, data="Transaction Data..." )
    Block.new( previous.index+1, data, previous.hash )
  end

end

b0 = Block.first( "Genesis" )
b1 = Block.next( b0, "Transaction Data..." )
b2 = Block.next( b1, "Transaction Data......" )
b3 = Block.next( b2, "More Transaction Data..." )
b4 = Block.next( b3, "Transaction Data..." )

blockchain = [b0, b1, b2, b3, b4]

pp blockchain
