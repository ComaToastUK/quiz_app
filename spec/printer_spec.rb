require './lib/printer'

RSpec.describe Printer do

  describe '#print' do
    it 'prints stuff' do
      printer = Printer.new
      expect{ printer.print('SomeString') }.to output("SomeString\n").to_stdout
    end
  end
end
