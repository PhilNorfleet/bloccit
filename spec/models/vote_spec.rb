require 'rails_helper'

describe Vote do
  describe "validations" do
    before do
      @up_vote = Vote.new( value: 1 )
      @down_vote = Vote.new( value: -1 )
      @invalid_vote = Vote.new( value: 2 )
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @invalid_vote.valid? ).to eq( false )
        expect( @up_vote.valid? ).to eq( true )
        expect( @down_vote.valid? ).to eq( true )
      end
    end
  end
end