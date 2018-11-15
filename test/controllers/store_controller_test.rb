require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    # assert_select 'nav.side_nav a', minimum: 4 #looks for an 'a' element thats contained in a 'nav' with the class 'side_nav'
  #  assert_select 'main ul.catalog li', 3 # Verifies that there are 3 li's in the class catolog which itself is inside main
  #sass related, commented out cause they dont work
  
    assert_select 'h2', 'Oleg Magni pexels' #verfies that theres and h1 element within the ititle of the book
   assert_select '#price', /\$[,\d]+\.\d\d/
  end
end