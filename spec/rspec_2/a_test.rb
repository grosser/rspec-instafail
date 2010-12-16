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

  it 'e' do
  end
end

class ExceptionWrappingException < RuntimeError
  attr_accessor :original_exception
end
