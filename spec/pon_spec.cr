require "./spec_helper"

private class Job < Pon::Model
  adapter mysql
  primary id : Int32
  field   name : String
  field   time : Time::Span
end

describe Pon::Model do
  it "(setup)" do
    Job.migrate!
  end
  
  describe ".count" do
    it "returns the number of records" do
      Job.count.should eq(0)
    end
  end

  describe ".new" do
    it "works" do
      job = Job.new(name: "foo")
      job.id?.should eq(nil)
      job.name.should eq("foo")
      job.time?.should eq(nil)
    end
  end
end
