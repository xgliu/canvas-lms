#
# Copyright (C) 2011 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InfoController do

  describe "POST 'record_error'" do
    it "should be successful" do
      post 'record_error'
      assert_recorded_error

      post 'record_error', :error => {:title => 'ugly', :message => 'bacon', :fried_ham => 'stupid'}
      assert_recorded_error
    end

  end

  def assert_recorded_error(msg = "Thanks for your help!  We'll get right on this")
    flash[:notice].should eql(msg)
    response.should be_redirect
    response.should redirect_to(root_url)
  end

  describe "GET 'health_check'" do
    it "should work" do
      get 'health_check'
      response.should be_success
      response.body.should == 'canvas ok'
    end
  end
end
