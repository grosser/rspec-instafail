describe 'RSpec::Instafail' do
  it "works correctly with RSpec 1.x" do
    output = `cd spec/rspec_1 && bundle exec spec a_test.rb --format RSpec::Instafail`
    expected_output = <<EXP
  1\\) x a
     expected: 2,
     got: 1 \\(using ==\\)
     # (\\.\\/)?a_test\\.rb:5:(in `block \\(2 levels\\) in <top \\(required\\)>')?
\\.\\.\\*\\.

Pending:

x d \\(TODO\\)
(\\.\\/)?a_test\\.rb:14(\:in `block in <top \\(required\\)>')?

1\\)
'x a' FAILED
expected: 2,
     got: 1 \\(using ==\\)
(\\./)?a_test\\.rb:5:(in `block \\(2 levels\\) in <top \\(required\\)>')?
EXP

    output.should =~ Regexp.new(expected_output, 'x')
  end

  context 'Rspec 2.x' do
    before(:all)do
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
      @output.should =~ /Finished in \d\.\d+ seconds\s*7 examples, 3 failures, 1 pending/
    end
  end
end

