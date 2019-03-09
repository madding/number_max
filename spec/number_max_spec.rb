# frozen_string_literal: true

RSpec.describe NumberMax::Counter do
  it 'has a version number' do
    expect(NumberMax::VERSION).not_to be nil
  end

  describe 'test counter' do
    let(:n_numbers) { 3 }
    let(:counter) { described_class.new(n_numbers) }
    before { @result = counter.call(data) }

    context 'data without numbers' do
      let!(:data) { 'shjsdhfj sdfhjsdfhkj sdfhjsdfhksjd' }

      it do
        expect(@result).to eql([])
      end
    end

    context 'data with numbers' do
      let!(:data) { '123 123 21gdfg231fdgf333gfg342  4 3 2 334' }

      it { expect(@result).to eql(%w[123 123 231]) }

      context 'when get more numbers' do
        let(:n_numbers) { 6 }

        it { expect(@result).to eql(%w[123 123 231 333 342 334]) }
      end
    end

    context 'data with numbers and spaces' do
      let!(:data) { '    sddsf123dfsdfsd   342   ' }

      it { expect(@result).to eql(%w[123 342]) }
    end

    context 'when parse data few times' do
      let(:n_numbers) { 9 }
      let(:data) { ' 2123 1232 22132  sdsdfd 3423 dsds f323 ' }
      let(:data2) { ' 32432=12 12312 1231 12122 232 22 221' }
      let(:data3) { ' 32432=12 12312 1231 12122 232 22 221' }

      it { expect(counter.call(data2)).to eql(%w[22132 32432 12312 12122]) }
      it do
        counter.call(data2)
        counter.call(data3)
        expect(counter.result).to eql(%w[22132 32432 12312 12122 32432 12312 12122])
      end
    end
  end
end
