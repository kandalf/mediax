require File.dirname(__FILE__) + "/../lib/file_system_descriptor"

describe FileSystemDescriptor do
  it "should have find method" do
    desc = FileSystemDescriptor.new
    desc.find.should be_nil
  end
end
