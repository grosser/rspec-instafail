require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rspec', 'instafail'))

describe 'x' do
  it 'fails logically' do
    1.should == 2
  end

  it 'b' do
  end

  it 'c' do
  end

  it 'pends' do
    pending
    raise
  end

  it 'raises a simple error' do
    raise 'shallow failure'
  end

  it 'raises a hidden error' do
    error = ExceptionWrappingException.new('There is an error in this error.')
    error.original_exception = RuntimeError.new('There is no error in this error.')
    raise error
  end

  it 'e' do
  end

  context "ancestors" do
    after do
      puts "ANCESTORS:#{example.example_group.ancestors.size}"
    end

    it "does not add ancestors on failure" do
      raise "BAM"
    end

    it "does not add ancestors on failure" do
    end
  end
end

class ExceptionWrappingException < RuntimeError
  attr_accessor :original_exception
end
