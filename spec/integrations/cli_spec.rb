# frozen_string_literal: true

RSpec.describe 'NUmberMax::CLI' do
  describe '#nmax' do
    specify 'success execute command' do
      expect(`cat test_data/test_file.txt | ./nmax 4`).to eql("[\"34534543\", \"34534543\", \"34534543\"]\n")
    end

    specify 'missing n param' do
      expect(`cat test_data/test_file.txt | ./nmax`).to eql('')
    end
  end
end
