describe 'RSpec::Instafail' do
  it "works correctly with RSpec 1.x" do
    output = `cd spec/rspec_1 && bundle exec spec a_test.rb --format RSpec::Instafail`
    output.should include("1: x a\n -> expected: 2,\n     got: 1 (using ==)\n\.\.\*\.")
    output.should =~ /Finished in \d\.\d+ seconds/
  end

  it "works correctly with RSpec 2.x" do
    output = `cd spec/rspec_2 && bundle exec rspec a_test.rb --require ../../lib/rspec/instafail --format RSpec::Instafail --no-color`
    output.should =~ /1: x a\n -> expected: 2,\n     got: 1 .*\.\.\*\./m
    output.should =~ /Finished in \d\.\d+ seconds/
  end
end