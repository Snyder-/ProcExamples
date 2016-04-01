require_relative '../proc_examples.rb'

module ProcExamples
  describe Options do
    context 'when initialized' do
      it 'has 100 brightness' do
        options = Options.new

        expect(options.brightness).to eq(100)
      end
    end

    context '#brightness' do
      let(:options) { Options.new }

      it 'changes to a valid brightness' do
        options.brightness = 83
        expect(options.brightness).to eq(83)
      end

      it 'raises OptionRangeError with invalid brightness' do
        expect { options.brightness = 101 }.to raise_error(OptionRangeError)
      end
    end
  end

  module CaptureBlock
    describe '.configure' do
      let(:app) { SomeClass }

      after :each do
        app.options.brightness = 100
      end

      it 'allows options to take a block' do
        app.configure { |config| config.brightness = 12 }

        expect(app.options.brightness).to eq(12)
      end

      it 'returns options object' do
        result = app.configure do |config|
          config.brightness = 46
        end

        expect(result.class).to eq(Options)
      end
    end
  end
end
