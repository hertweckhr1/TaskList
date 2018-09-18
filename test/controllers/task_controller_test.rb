require "test_helper"

describe TaskController do
  it "should get Index" do
    get task_Index_url
    value(response).must_be :success?
  end

end
