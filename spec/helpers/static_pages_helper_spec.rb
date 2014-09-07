require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the StaticPagesHelper. For example:
#
# describe StaticPagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe StaticPagesHelper, :type => :helper do

  describe '#create_title' do
    it { expect(create_title('Home')).to eq 'ISL fantasy | Home' }
    it { expect(create_title('')).to eq 'ISL fantasy' }
  end

end
