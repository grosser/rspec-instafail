describe 'RSpec::Instafail' do
  context "RSpec 1.x" do
    before :all do
      @rspec_result = `cd spec/rspec_1 && bundle exec spec a_test.rb --format RSpec::Instafail`
    end

    before do
      @output = @rspec_result.dup
    end

    it "outputs failures at start of output" do
      @output.should =~ /^\s*1\)\s*'x fails logically'/m
    end

    it 'outputs errors in middle of output' do
      @output.should =~ /\.\.\*\s*2\)\s*RuntimeError in 'x raises a simple error'/m
    end

    it 'outputs the the ending block' do
      @output.should =~ /Finished in \d\.\d+ seconds\s*7 examples, 3 failures, 1 pending/
    end
  end

  context 'Rspec 2.x' do
    before :all do
      @rspec_result = `cd spec/rspec_2 && bundle exec rspec a_test.rb --require ../../lib/rspec/instafail --format RSpec::Instafail --no-color`
    end

    before do
      @output = @rspec_result.dup
    end

    it "outputs failures at start of output" do
      @output.should =~ /^\s+1\) x fails logically/m
    end

    it 'outputs errors in middle of output' do
      @output.should =~ /\.\.\*\s*2\) x raises a simple error/m
    end

    it 'outputs the the ending block' do
      @output.should =~ /Finished in \d\.\d+ seconds\s*9 examples, 4 failures, 1 pending/
    end

    it "does not add ancestors after failures" do
      @output.should include('ANCESTORS:2')
      @output.should_not include('ANCESTORS:3')
    end
  end
end

