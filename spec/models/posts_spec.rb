require 'spec_helper'

describe Post do

  it { should have_valid(:title).when('Title') }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:author).when('Author') }
  it { should_not have_valid(:author).when(nil, '') }

  it { should have_valid(:body).when('Body') }
  it { should_not have_valid(:body).when(nil, '') }

  it { should have_many(:comments) }

end
