require_relative 'quicksort'

describe 'Sorting' do
  [
    10,
    100,
    # 1_000,
    # 100_000,
    # 1_000_000,
  ].each do |size|
    context "for a #{size}-item array" do
      let(:starting_array) { (1..size).to_a }

      context 'basic' do
        let(:expected) { starting_array }

        10.times do
          let(:target) { expected.shuffle }

          it "sorts the array" do
            expect(sort(target)).to eq expected
          end
        end
      end

      context 'non-contiguous' do
        let(:expected) { chop(starting_array) }

        10.times do
          let(:target) { expected.shuffle }

          it "sorts the array" do
            expect(sort(target)).to eq expected
          end
        end
      end

      context 'pre-sorted' do
        let(:expected) { starting_array }
        let(:target) { expected.clone }

        it "returns the pre-sorted array" do
          expect(sort(target)).to eq expected
        end
      end
    end
  end
end

def chop(array)
  array - rand(array.length * 0.2).to_i.times.map { array.sample }
end
